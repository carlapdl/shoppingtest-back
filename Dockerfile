# php/Dockerfile
# Using php:8.3-apache as the base image for the latest stable PHP with Apache
FROM php:8.3-apache

# Install common PHP extensions required for typical web applications
# `pdo` and `pdo_mysql` are essential for connecting to MySQL.
# Add any other extensions your specific application requires (e.g., gd, zip, intl, bcmath, exif, soap, mbstring).
RUN docker-php-ext-install pdo pdo_mysql mysqli && \
    # Enable Apache's mod_rewrite module, crucial for clean URLs and most PHP frameworks (e.g., Laravel, Symfony).
    a2enmod rewrite && \
    #Enable mod_headers for CORS directives
    a2enmod headers

# Install MySQL client for debugging/CLI access from the web container
# Install system dependencies, Composer, and Git
#RUN apt-get update && \
    #apt-get install -y default-mysql-client && \
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libzip-dev \
    git \
    unzip \
    #Clean up apt cache to keep image small
    && rm -rf /var/lib/apt/lists/* 
    #rm -rf /var/lib/apt/lists/*

# Optional: Install Composer (PHP Dependency Manager)
# This copies the latest Composer executable into the image, making it available globally.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# For GraphQL
#RUN composer require webonyx/graphql-php

# Optional: Set the timezone for consistency in logs and date functions.
# Uncomment the following lines and set your desired timezone if needed.
# ENV TZ Asia/Manila
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Optional: Copy custom php.ini settings if you need to override default PHP configurations.
# For example, to increase upload limits or memory limits.
# COPY custom.ini /usr/local/etc/php/conf.d/my-custom.ini

# Update Apache's config to allow .htaccess files
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# This prevents conflicts with our custom 000-default.conf.
RUN a2dissite 000-default || true

# Copy your custom 000-default.conf into sites-available.
COPY docker/php/000-default.conf /etc/apache2/sites-available/000-default.conf

# Enable your custom 000-default.conf
RUN echo "Attempting to enable 000-default.conf..." && \
    a2ensite 000-default.conf && \
    echo "--- Contents of /etc/apache2/sites-enabled/ after a2ensite ---" && \
    ls -la /etc/apache2/sites-enabled/ && \
    echo "--- Verification of 000-default.conf symlink ---" && \
    ls -la /etc/apache2/sites-enabled/000-default.conf && \
    echo "000-default.conf successfully linked in sites-enabled. Reloading Apache." && \
    service apache2 reload || echo "Apache reload failed, but build continuing."

# Set the working directory inside the container for your application code
WORKDIR /var/www/html

# --- Composer Dependency Management ---
# Copy composer.json and composer.lock files first to leverage Docker's cache
# This layer will only be rebuilt if these files change
COPY composer.json ./
COPY composer.lock ./

# >>> ADD THIS LINE TEMPORARILY FOR DEBUGGING <<<
#CMD ["bash"]


# Run composer install to download all dependencies, including webonyx/graphql-php
# The `composer require` is a development command to add dependencies to the json file.
# `composer install` is the production command to install them.
# This creates the 'vendor' directory at /var/www/html/vendor.
RUN composer install --no-dev --optimize-autoloader

# For GraphQL
#RUN composer require webonyx/graphql-php

# Copy .htaccess file to WORKDIR
#COPY .htaccess ./

# --- Copy the rest of your source code ---
# The previous layers are now cached. This layer is rebuilt on every code change.
#COPY src/ public/ 
#COPY src/ ./
COPY . .

# --- DIAGNOSTIC STEPS: Will show in your build logs what was copied ---
#RUN echo "--- Listing contents of WORKDIR (/var/www/html) after COPY . . ---"
#RUN ls -la /var/www/html/
#RUN echo "--- Checking specifically for test-exclude.txt ---"
#RUN ls -la /var/www/html/test-exclude.txt || echo "test-exclude.txt was successfully excluded."
#RUN echo "--- Diagnostics Complete ---"
# --- END DIAGNOSTICS ---

# --- Explicitly dump Composer's autoloader ---
# This ensures that Composer discovers all your new classes (like GraphQL.php)
# and updates its autoloader mappings.
RUN composer dump-autoload --optimize --no-dev # --optimize for faster loading in production

# Expose port 80 for the web server
EXPOSE 80
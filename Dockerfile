# php/Dockerfile
# Using php:8.3-apache as the base image for the latest stable PHP with Apache
FROM php:8.3-apache

# Install common PHP extensions required for typical web applications
# `pdo` and `pdo_mysql` are essential for connecting to MySQL.
# Add any other extensions your specific application requires (e.g., gd, zip, intl, bcmath, exif, soap, mbstring).
RUN docker-php-ext-install pdo pdo_mysql && \
    # Enable Apache's mod_rewrite module, crucial for clean URLs and most PHP frameworks (e.g., Laravel, Symfony).
    a2enmod rewrite

# Install MySQL client for debugging/CLI access from the web container
RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/* # Clean up apt cache to keep image small

# Optional: Install Composer (PHP Dependency Manager)
# This copies the latest Composer executable into the image, making it available globally.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Optional: Set the timezone for consistency in logs and date functions.
# Uncomment the following lines and set your desired timezone if needed.
# ENV TZ Asia/Manila
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Optional: Copy custom php.ini settings if you need to override default PHP configurations.
# For example, to increase upload limits or memory limits.
# COPY custom.ini /usr/local/etc/php/conf.d/my-custom.ini

# Set the working directory inside the container for your application code
WORKDIR /var/www/html
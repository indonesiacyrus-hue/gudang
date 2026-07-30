FROM php:7.4-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install required PHP extensions for CodeIgniter
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html/

# Copy the application source code to the container
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

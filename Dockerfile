# Use official PHP Apache image
FROM php:8.2-apache

# Enable apache mods
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo_mysql

# Copy project files into the web directory
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80 for Render
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
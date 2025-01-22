# Use PHP 7.4 Apache image
FROM php:7.4-apache

# Install any required dependencies like zip
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    && docker-php-ext-install zip

# Enable Apache mod_rewrite (if necessary)
RUN a2enmod rewrite

# Set the working directory (this will be your project folder)
WORKDIR /var/www/html

# Copy your local files into the container at /var/www/html
COPY . /var/www/html/

# Ensure the files are accessible by the Apache web server (www-data user)
RUN chown -R www-data:www-data /var/www/html

# Expose the HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

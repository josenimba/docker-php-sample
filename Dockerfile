# Utiliza la imagen oficial de PHP con Apache y la versión específica de PHP como base
FROM php:8.2-apache AS final

# Copia el archivo de configuración de Apache al contenedor
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Habilita el módulo de reescritura de Apache
RUN a2enmod rewrite

# Establece el directorio de trabajo en el contenedor
WORKDIR /var/www/html

# Copia el código fuente de la aplicación al contenedor
COPY ./src .

# Exponer el puerto 80 del contenedor (utilizado por Apache)
EXPOSE 80

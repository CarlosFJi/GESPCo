# Stage 1: Build the application
FROM dart:stable AS build

# Install dependencies for Flutter
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/CarlosFJi/GESPCo
WORKDIR /GESPCo/gespco

# Clone the Flutter repository
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set the Flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Checkout the specific version of Flutter
RUN flutter channel stable
RUN flutter upgrade
RUN git -C /usr/local/flutter checkout 1f6bdb6

#above after checkout is commit hash which indicates the version of flutter
#to learn more about flutter versioning, please visit https://flutter.dev/docs/development/tools/sdk/releases?tab=linux

# Verify Flutter installation
RUN flutter doctor -v
RUN flutter channel master
RUN flutter config --enable-web

# Set working directory
WORKDIR /app
# Copy over your app
COPY pubspec.* /app/
RUN flutter pub get
COPY . /app
RUN flutter pub upgrade 
RUN flutter build web --profile --no-tree-shake-icons

# Stage 2: Create the runtime environment with Apache
FROM httpd:alpine

# Install gettext for envsubst
RUN apk add --no-cache gettext

# Copy the built app to the Apache server directory
COPY --from=build /app/build/web/ /usr/local/apache2/htdocs/

# Expose port
EXPOSE 8080

# Copy the Apache configuration template and startup script
COPY httpd.conf.template /usr/local/apache2/conf/httpd.conf.template

# Add a shell script to start Apache with the right PORT
COPY start-apache.sh /usr/local/bin/start-apache.sh
RUN chmod +x /usr/local/bin/start-apache.sh

# Start Apache using the startup script
CMD ["start-apache.sh"]


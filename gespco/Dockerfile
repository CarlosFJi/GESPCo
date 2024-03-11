# Stage 1
FROM debian:latest AS build-env
ENV HOST 0.0.0.0
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN flutter channel master
RUN flutter upgrade
RUN mkdir /app/
COPY . /app/
RUN flutter config --enable-web

# Stage 2
FROM nginx:1.21.1-alpine


COPY --from=build-env /app/build/web /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
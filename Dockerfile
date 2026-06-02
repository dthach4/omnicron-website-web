FROM dart:stable AS build

ARG API_URL
ENV API_URL=${API_URL}

ARG MATOMO_URL
ENV MATOMO_URL=${MATOMO_URL}

RUN dart pub global activate jaspr_cli
WORKDIR /app
COPY . .
RUN rm -f pubspec_overrides.yaml
RUN dart pub get
RUN dart pub global run jaspr_cli:jaspr build --experimental-wasm --verbose \
  --dart-define-client=API_URL=$API_URL \
  --dart-define-client=MATOMO_URL=$MATOMO_URL

FROM busybox:latest

COPY --from=build /app/build/jaspr/ /www/
COPY httpd.conf /etc/httpd.conf
EXPOSE 8080
CMD ["httpd", "-v", "-f", "-p", "8080", "-h", "/www", "-c", "/etc/httpd.conf"]
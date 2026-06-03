# Omnicron Website

This repository contains the source code for the
[Omnicron website](https://omnicron.it/), built with [Dart](https://dart.dev/)
and the [Jaspr](https://jaspr.dart.dev/) framework.

The project can be run locally with `jaspr_cli` or inside Docker using the
provided `Dockerfile`.

It requires the Web API found in
[dthach4/omnicron-website-api](https://github.com/dthach4/omnicron-website-api)
in order to work.

## Requirements

- [Jaspr CLI](https://jaspr.site/) if running locally
- [Docker](https://www.docker.com/) if running in a container

## Configuration

The application requires the following environment variables at build time:

| Variable | Description |
| --- | --- |
| `API_URL` | The base URL for the [backend API](https://github.com/dthach4/omnicron-website-api) |
| `MATOMO_URL` | The base URL for the [Matomo](https://matomo.org/) environment |

### Without Docker

Pass the values with `--dart-define-client`.

### With Docker

Pass the values with `--build-arg`.

## Running locally with Jaspr

Install the Jaspr CLI, then run:

```bash
jaspr serve \
  --dart-define-client=API_URL=https://api.example.com \
  --dart-define-client=MATOMO_URL=https://matomo.example.com
```

The development server will be available at:

```text
http://localhost:8080
```

## Building locally with Jaspr

Build the project with:

```bash
jaspr build --experimental-wasm \
  --dart-define-client=API_URL=https://api.example.com \
  --dart-define-client=MATOMO_URL=https://matomo.example.com
```

The compiled output will be written to:

```text
build/jaspr/
```

## Running with Docker

Build the image with the required build arguments:

```bash
docker build \
  --build-arg API_URL=https://api.example.com \
  --build-arg MATOMO_URL=https://matomo.example.com \
  -t omnicron-website-web .
```

Run the container:

```bash
docker run --rm -p 8080:8080 omnicron-website-web
```


If you want to expose the website on a different port, adjust the `-p` mapping
accordingly (you can follow the
[Publishing and exposing ports](https://docs.docker.com/get-started/docker-concepts/running-containers/publishing-ports/)
guide in the Docker docs).

## Building with Docker

If you only want to build the Docker image, use the same `docker build` command
shown above.

## License

The code in this repository is distributed under the MIT License. See the
[LICENSE](LICENSE) file for details.
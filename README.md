# What is this?

A template project for go-based webservices. Highly opinionated - providing stylesheets using [Dart SASS](https://sass-lang.com/dart-sass/), hot-reloading via [air](https://github.com/cosmtrek/air), templating html via [templ](https://github.com/a-h/templ) and using [htmx](https://htmx.org/) alongside [echo](https://github.com/labstack/echo) for application state and routing.

Everything is designed for ease of use of [devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) (docker under the hood).
Using devcontainers allow for entirely uniform, containerised development environments.

The `.devcontainer/docker-compose.yml` configure two services.
First and foremost the `webservice`, which is the service the devcontainer connects and opens as its workspace.
It is defined by the `.devcontainer/Webservice.Dockerfile` (installs [zsh](https://ohmyz.sh/), [Dart SASS](https://sass-lang.com/dart-sass/) and execute `.devcontainer/postCreateCommand.sh`).

The second service is the `db`, which is a simple toy [postgresSQL](https://www.postgresql.org/) relational database. It emits a healthcheck/heartbeat on start for good measure, that blocks the `webservice` if it fail. See more [here](https://docs.docker.com/compose/compose-file/compose-file-v3/#healthcheck).

For vscode users, install the [vscode-devcontainer extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and simply build the container.
Others, simply build the container using `docker compose up -d` (-d: detached), see [docker compose up](https://docs.docker.com/reference/cli/docker/compose/up/) for more.

# Roadmap

- ✅ docker-compose.yml for devcontainer and db seperation
- ✅ basic hello world echo-based web service
- ✅ zsh in devcontainer
- ✅ hot-reloading using air
- ✅ SASS for stylesheets
- ✅ templ
- ✅ htmx
- ⬜ write basic templ-rendering function
- ⬜ refine hello world web-service to use templ, htmx and SASS
- ⬜ add `sass --watch ...` to air configuration (.toml)
- ⬜ provide toy db for hello world service
- ⬜ fly.io batteries for deployment
- ⬜

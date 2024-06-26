FROM golang:latest

# Install zsh
RUN apt-get update && apt-get install -y zsh

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy the zsh configuration file from local system to the container
RUN chsh -s ~/root/.zshrc

RUN apt-get update && apt-get install -y wget

# Download and extract dart-sass
RUN wget https://github.com/sass/dart-sass/releases/download/1.72.0/dart-sass-1.72.0-linux-x64.tar.gz && \
  tar -xvf dart-sass-1.72.0-linux-x64.tar.gz && \
  mv dart-sass /usr/local/dart-sass

# Add the directory containing sass to the PATH in .zshrc
RUN echo 'export PATH="/usr/local/dart-sass:$PATH"' >> ~/.zshrc

# Clean up unnecessary files
RUN rm -rf dart-sass-1.72.0-linux-x64.tar.gz

# Install golangci-lint
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.57.1

# Install gofumpt, templ and air
RUN go install mvdan.cc/gofumpt@latest && go install github.com/a-h/templ/cmd/templ@latest && go install github.com/cosmtrek/air@latest

CMD ["zsh"]

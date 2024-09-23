FROM debian:bookworm
RUN apt update && apt install -y

RUN apt-get -y update && \
    apt-get -y --no-install-suggests install \
        gcc bzip2 gnupg2 ca-certificates curl git neovim openssh-server && \
    curl -o ~/.inputrc https://github.com/tsoernes/config/raw/master/.inputrc && \
    curl -fsSL https://pixi.sh/install.sh | bash

ENV PATH="/root/.pixi/bin:${PATH}"

RUN set -ex && \
    mkdir /app && cd /app && \
    rm -rf ~/.cache/pip && \
    apt-get clean && \
    apt-get autoclean

# Copy your project definitions into the image
COPY * .

# Run the virtual env creator and dependency installer
RUN pixi install

WORKDIR /app
# CMD poetry run fireducks-poc extra-args
CMD pixi run runfireducks

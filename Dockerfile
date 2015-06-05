FROM debian:jessie


RUN apt-get update && \
    apt-get install -y netcat-openbsd curl binutils gcc && \
    apt-get clean
COPY docker/waitport /usr/local/bin/


# Install Rust

WORKDIR /tmp
RUN mkdir rust && cd rust && \
    curl -o rust.tar.gz https://static.rust-lang.org/dist/rust-1.0.0-x86_64-unknown-linux-gnu.tar.gz && \
    tar xzf rust.tar.gz --strip-components=1 && \
    ./install.sh && \
    cd /tmp/ && rm -rf rust
    

# Never run as root...
RUN adduser --disabled-password --gecos '' test

# Copy everything in...
ADD . /code
RUN chown -R test.test /code


USER test
WORKDIR /code

RUN cargo update

CMD ping postgres


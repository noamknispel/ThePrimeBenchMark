FROM debian:testing
ENV LEIN_VERSION=2.5.3
ENV LEIN_ROOT=value
WORKDIR /tmp
RUN apt-get update && \
    apt-get install -y python-dev \
                       python-pip \
                       build-essential \
                       llvm3.7-dev \
                       python-numpy \
                       python3 \
                       pypy \
                       lua5.1 \
                       luajit \
                       build-essential \
                       php5-cli \
                       php7.0-cli \
                       ruby \
                       nodejs \
                       nodejs-legacy \
                       mawk \
                       clojure1.6 \
                       tcl \
                       time \
                       golang \
                       wget && \
    mkdir /tmp/leiningen && \
    pip install numba && \
    wget --quiet https://github.com/technomancy/leiningen/archive/$LEIN_VERSION.tar.gz -O - | \
    tar -xz -C /tmp/leiningen/ --strip-components=1 && \
    mv /tmp/leiningen/bin/lein-pkg /usr/local/bin/lein && \
    chmod 0755 /usr/local/bin/lein && \
    wget --quiet \
        https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip \
        -O /usr/share/java/leiningen-$LEIN_VERSION-standalone.jar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY ./ /benchmark
WORKDIR /benchmark
RUN make
CMD ["make", "test"]

FROM clojure:temurin-21-tools-deps-1.12.4.1618-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    git \
    rlwrap \
    unzip \
    ca-certificates \
    procps \
    less \
    vim \
 && rm -rf /var/lib/apt/lists/*

ARG CLOJURE_LSP_VERSION=2026.02.20-16.08.58

RUN curl -fsSL -o /tmp/clojure-lsp.zip \
  "https://github.com/clojure-lsp/clojure-lsp/releases/download/${CLOJURE_LSP_VERSION}/clojure-lsp-native-static-linux-amd64.zip" \
  && cd /usr/local/bin \
  && unzip /tmp/clojure-lsp.zip \
  && chmod +x /usr/local/bin/clojure-lsp \
  && rm /tmp/clojure-lsp.zip
  
WORKDIR /workspace

CMD ["/bin/sh", "-lc", "sleep infinity"]
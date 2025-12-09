FROM rust:1.83

# 安裝完整的編譯依賴 (一次到位)
RUN apt-get update && \
    apt-get install -y \
    git \
    clang \
    libclang-dev \
    cmake \
    pkg-config \
    libssl-dev \
    libudev-dev \
    protobuf-compiler \
    libprotobuf-dev \
    && rm -rf /var/lib/apt/lists/*

# 確保 Rust 是最新版本
RUN rustup update stable && \
    rustup default stable

# 編譯安裝 IOTA CLI
RUN cargo install --locked \
    --git https://github.com/iotaledger/iota.git \
    --branch testnet iota

# 確保 PATH 包含 cargo bin
ENV PATH="/usr/local/cargo/bin:${PATH}"

WORKDIR /workspace

# 預設執行 shell
ENTRYPOINT ["/bin/bash", "-c"]

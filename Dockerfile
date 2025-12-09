FROM rust:1.75-slim

# 安裝必要工具
RUN apt-get update && \
    apt-get install -y git ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 編譯安裝 IOTA CLI
RUN cargo install --locked \
    --git https://github.com/iotaledger/iota.git \
    --branch testnet iota

# 確保 PATH 包含 cargo bin
ENV PATH="/usr/local/cargo/bin:${PATH}"

WORKDIR /workspace

# 預設執行 shell
ENTRYPOINT ["/bin/bash", "-c"]

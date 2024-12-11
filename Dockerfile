FROM rust:1.83

# For China
# COPY debian.sources /etc/apt/sources.list.d/debian.sources

RUN apt-get clean && \
    apt-get update --allow-insecure-repositories && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    protobuf-compiler \
    openssl \
    curl && \
    update-ca-certificates

ENV NEXUS_HOME=/root/.nexus \
    NONINTERACTIVE=true 

# For China
# ENV RUSTUP_DIST_SERVER=https://rsproxy.cn \
#    RUSTUP_UPDATE_ROOT=https://rsproxy.cn/rustup

WORKDIR /app
# For China
# RUN mkdir -p ${NEXUS_HOME} && \
#     git clone https://ghp.ci/https://github.com/nexus-xyz/network-api ${NEXUS_HOME}/network-api && \
#     cd ${NEXUS_HOME}/network-api && \
#     git checkout $(git rev-list --tags --max-count=1)

RUN mkdir -p ${NEXUS_HOME} && \
    git clone https://github.com/nexus-xyz/network-api ${NEXUS_HOME}/network-api && \
    cd ${NEXUS_HOME}/network-api && \
    git checkout $(git rev-list --tags --max-count=1)

WORKDIR ${NEXUS_HOME}/network-api/clients/cli
RUN cargo build --release --bin prover

ENTRYPOINT ["./target/release/prover", "beta.orchestrator.nexus.xyz"]
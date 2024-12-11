# Nexus Prover Docker

This repository contains a Dockerfile for building and running the Nexus Prover in a containerized environment.

## Prerequisites

- Docker installed on your system
- Git
- A valid prover-id file

## Quick Start

1. Clone this repository:

```bash
git clone https://github.com/Tallone/nexus-docker.git
cd nexus-docker
```

2. Build the Docker image:

```bash
docker build -t nexus-prover .
```

3. Run the container:

```bash
docker run --name nexus-network -v ./prover-id:/root/.nexus/prover-id nexus-prover
```

Replace:
- `./prover-id` with the actual path to your prover-id file
- `nexus-network` with your preferred container name

Common docker commands:
```bash
# Stop the container
docker stop nexus-network

# Start the container again
docker start nexus-network

# Remove the container
docker rm nexus-network

# View container logs
docker logs nexus-network
```

## Configuration

The Dockerfile includes:
- Rust environment setup
- Tsinghua mirrors for faster package downloads in China
- All necessary dependencies (protobuf, openssl, etc.)
- Automatic compilation of the prover binary

## Environment Variables

You can set the following environment variables when running the container:
```bash
docker run --name nexus-network -v ./prover-id:/root/.nexus/prover-id nexus-prover
```

## Troubleshooting

If you encounter certificate verification issues, make sure your prover-id file is valid and properly mounted in the container.

## License

This project is licensed under the terms specified by the Nexus Network.

## Contributing

Feel free to submit issues and pull requests.
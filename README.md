# IOTA CLI Docker Image

Pre-built Docker image with IOTA Move CLI for CI/CD usage.

## Usage
```bash
docker run --rm ghcr.io/vagrantpi/iota-cli:latest "iota --version"
```

## GitHub Actions
```yaml
- name: Run IOTA Move tests
  run: |
    docker run --rm \
      -v ${{ github.workspace }}/contracts:/workspace/contracts \
      -w /workspace \
      ghcr.io/vagrantpi/iota-cli:latest \
      "cd contracts && iota move test"
```

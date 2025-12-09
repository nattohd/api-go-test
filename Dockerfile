# ===========================================
# Development stage (for devcontainer)
# ===========================================
FROM golang:1.25.5-trixie AS dev

WORKDIR /app/src

# Install make
RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*

# Keep container running for development
CMD ["tail", "-f", "/dev/null"]

# ===========================================
# Build stage (for production)
# ===========================================
FROM golang:1.25.5-trixie AS builder

WORKDIR /app/src

COPY src/go.mod src/go.sum ./
RUN go mod download

COPY src/ .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

# ===========================================
# Production stage (minimal image for Cloud Run)
# ===========================================
FROM gcr.io/distroless/static-debian12 AS prod

WORKDIR /app

COPY --from=builder /app/src/app .

EXPOSE 8080

CMD ["./app"]

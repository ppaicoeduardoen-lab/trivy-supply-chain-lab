FROM golang:1.22-alpine AS builder

WORKDIR /src
COPY . .

RUN go build -o trivy-lab ./cmd/trivy-lab

FROM alpine:3.20

WORKDIR /app
COPY --from=builder /src/trivy-lab /usr/local/bin/trivy-lab
COPY samples/ samples/

CMD ["trivy-lab", "samples/vulnerable.env"]
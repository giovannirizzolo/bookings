# builder stage
FROM golang:1.23.1 AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
    -trimpath \
    -ldflags="-s -w" \
    -o /out/bookings ./cmd/bookings

FROM scratch
COPY --from=builder /out/bookings /bookings
ENTRYPOINT [ "/bookings" ]
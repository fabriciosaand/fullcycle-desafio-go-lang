FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go build -ldflags "-s -w" -o /app app.go

FROM scratch
COPY --from=builder /app /app
CMD ["/app"]
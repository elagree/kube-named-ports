FROM golang:1.17-buster as builder
WORKDIR /go/src/github.com/bpineau/kube-named-ports
COPY . .
RUN make build

FROM alpine:3.15
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/src/github.com/bpineau/kube-named-ports/kube-named-ports /usr/bin/
ENTRYPOINT ["/usr/bin/kube-named-ports"]

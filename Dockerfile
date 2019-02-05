FROM golang as src

COPY zero.go .
ARG GOOS=linux
ARG CGO_ENABLED=0

RUN go build -ldflags '-s -w' -a -o /zero

FROM scratch
COPY --from=src /zero /zero
CMD ["/zero"]

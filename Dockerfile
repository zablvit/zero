FROM tomasbasham/nasm as builder

WORKDIR /tmp/app
COPY zero.asm .
RUN nasm -f bin -o zero zero.asm && chmod +x zero

FROM scratch
COPY --from=builder /tmp/app/zero zero
CMD ["/zero"]

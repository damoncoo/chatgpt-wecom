FROM --platform=$BUILDPLATFORM alpine as certs
RUN apk update && apk add ca-certificates

FROM busybox
COPY --from=certs /etc/ssl/certs /etc/ssl/certs

ARG TARGETOS
ARG TARGETARCH

COPY chatgpt-wecom.${TARGETARCH}-${TARGETOS} /bin/chatgpt-webcom

CMD ["/bin/chatgpt-wecom", "-conf=/conf/chatgpt.conf"]
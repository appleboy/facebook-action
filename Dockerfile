# Rebuild the original release with a patched Go runtime and supported Alpine.
FROM --platform=$BUILDPLATFORM golang:1.26.7-alpine AS build
ARG TARGETOS
ARG TARGETARCH
WORKDIR /src
ADD https://api.github.com/repos/appleboy/drone-facebook/tarball/505096172b167e0b396c5ccaf064eb279c63ec04 /tmp/source.tar.gz
RUN echo "335b4f43d0c20858102ab4a5250ff751f3962ee207daf02b61df761008b6bdfd  /tmp/source.tar.gz" | sha256sum -c - \
    && tar -xzf /tmp/source.tar.gz --strip-components=1 -C /src \
    && CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -trimpath -o /bin/drone-facebook .

FROM alpine:3.23
RUN apk add --no-cache ca-certificates
COPY --from=build /bin/drone-facebook /bin/drone-facebook
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

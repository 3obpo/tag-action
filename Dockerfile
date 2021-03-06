FROM alpine
LABEL "repository"="https://github.com/3obpo/tag-action"
LABEL "homepage"="https://github.com/3obpo/tag-action"
LABEL "maintainer"="3obpo"

COPY ./contrib/semver ./contrib/semver
RUN install ./contrib/semver /usr/local/bin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN apk update && apk add bash git curl jq

ENTRYPOINT ["/entrypoint.sh"]
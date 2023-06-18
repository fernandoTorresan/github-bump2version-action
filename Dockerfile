FROM python:3-alpine
LABEL maintainer="Fernando Torresan de Oliveira"
LABEL repository="https://github.com/fernandoTorresan/github-bump2version-action"
LABEL homepage="https://github.com/fernandoTorresan/github-bump2version-action"

# Install our pre-reqs
RUN apk add --no-cache git bash curl jq

# Check to make sure pip is fully upgraded
RUN pip install --no-cache-dir -U pip

# Install bumpversion from pypi - https://pypi.org/project/bump2version/
RUN pip install --no-cache-dir bump2version==1.0.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
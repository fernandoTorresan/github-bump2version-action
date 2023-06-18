FROM python:3.9.17-alpine3.18
LABEL maintainer="Fernando Torresan de Oliveira"
LABEL repository="https://github.com/fernandoTorresan/github-bump2version-action"
LABEL homepage="https://github.com/fernandoTorresan/github-bump2version-action"

# Install our pre-reqs
RUN apk add --no-cache \
    git=2.40.1-r0 \
    curl=8.1.2-r0 \
    bash=5.2.15-r5 \
    jq=1.6-r3

# Ref.: https://github.com/actions/runner-images/issues/6775#issuecomment-1410270956
RUN git config --system --add safe.directory /github/workspace

# Check to make sure pip is fully upgraded
RUN pip install --no-cache-dir -U pip==23.1.2

# Install bumpversion from pypi - https://pypi.org/project/bump2version/
RUN pip install --no-cache-dir bump2version==1.0.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
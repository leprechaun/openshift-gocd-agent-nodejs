#!/usr/bin/env bash
#!/bin/bash
set -e

export CONFIG_FOLDER=/usr/share/go-agent/config

mkdir -p $CONFIG_FOLDER

# INFO Store access tokens during deploy time
# We get access token from `oc secret` during deploy time and store it
# @see https://git-scm.com/book/gr/v2/Git-Tools-Credential-Storage
if [[ -n $GITHUB_USERNAME || -n $GITHUB_TOKEN ]]; then
  git config --global credential.helper "store --file ${CONFIG_FOLDER}/.git-credentials"
  cat <<EOF > ${CONFIG_FOLDER}/.git-credentials
https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@${GITHUB_HOST}
EOF
fi

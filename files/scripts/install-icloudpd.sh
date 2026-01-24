#!/usr/bin/env bash

set -oue pipefail

ICLOUDPD_VERSION="1.32.2"

curl -L "https://github.com/icloud-photos-downloader/icloud_photos_downloader/releases/download/v${ICLOUDPD_VERSION}/icloudpd-${ICLOUDPD_VERSION}-linux-amd64" \
  -o /usr/bin/icloudpd

chmod +x /usr/bin/icloudpd

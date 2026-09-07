#!/usr/bin/env bash
set -euo pipefail

URL="http://127.0.0.1:8000/packages.json"

{
    echo "# Active Packages"
    echo
    echo "| name | version | downloads |"
    echo "|---|---|---:|"

    curl -fsS "$URL" |
    jq -r '
      map(select(.status == "active" and .downloads >= 100))
      | sort_by(-.downloads, .name)
      | .[]
      | "| \(.name) | \(.version) | \(.downloads) |"
    '
} > summary.md

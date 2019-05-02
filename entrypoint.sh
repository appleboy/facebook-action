#!/bin/sh

set -eu

export GITHUB="true"

[ -n "$*" ] && export FB_MESSAGE="$*"

/bin/drone-facebook

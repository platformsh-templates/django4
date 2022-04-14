#!/usr/bin/env bash

platform tunnel:close -y
platform tunnel:open
export PLATFORM_RELATIONSHIPS="$(platform tunnel:info --encode)"
echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq

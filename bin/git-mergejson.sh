#!/usr/bin/env bash

# OPTIONAL: Use jq to merge the two JSON files.

jq --slurp '.[1] as $logstat | .[0] | map(.paths = $logstat[.commit])' $1 $2

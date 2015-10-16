#!/bin/bash

set -x

# copy .env.default to .env and fill in missing values
source .env

NAME=$1

curl --request POST "https://api.digitalocean.com/v2/droplets" \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer $TOKEN" \
     --data '{"region":"'"${REGION}"'",
        "image":"coreos-stable",
	"private_networking":true,
        "size":"'"$SIZE"'",
        "user_data": "'"$(cat cloud-config)"'",
        "ssh_keys":["'"$SSH_KEY_ID"'"],
        "name":"'"${NAME}"'"}'


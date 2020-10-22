#!/bin/sh -l

export VAULT_TOKEN="$(curl --request POST --data '{"role_id": "'$2'", "secret_id": "'$3'"}' $1/v1/auth/approle/login | jq .auth.client_token | sed -e 's/^"//' -e 's/"$//')"
echo "::set-output name=token::$VAULT_TOKEN"

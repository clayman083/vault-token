#!/bin/sh -l

export VAULT_ADDR=$1
export VAULT_TOKEN="$(vault write -field=token /auth/approle/login role_id=$2 secret_id=$3)"
echo "::set-output name=token::$VAULT_TOKEN"

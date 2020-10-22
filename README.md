# Vault token docker action

This action authenticates in Hashicorp Vault with AppRole credentials and returns VAULT_TOKEN for deployment purpose.

## Inputs

### `vault_addr`

**Required** Address of your Vault server.

### `role_id`

**Required** AppRole role id.

### `secret_id`

**Required** AppRole secret id.

## Outputs

### `token`

Vault token associated with your role id.

## Example usage

    - name: Get Vault token
      id: vault
      uses: clayman083/vault-token
      with:
        vault_addr: ${{ secrets.VAULT_ADDR }}
        role_id: ${{ secrets.VAULT_ROLE_ID }}
        secret_id: ${{ secrets.VAULT_SECRET_ID }}

    - name: Deploy new version
      env:
        ANSIBLE_HOST_KEY_CHECKING: False
        DOCKER_USERNAME: ${{ secrets.DOCKER_USERNAME }}
        DOCKER_PASSWORD: ${{ secrets.DOCKER_PASSWORD }}
        PASSPORT_VERSION: ${{ steps.vars.outputs.tag }}
        VAULT_ADDR: ${{ secrets.VAULT_ADDR }}
        VAULT_TOKEN: ${{ steps.vault.output.token }}
      run: |
        ansible-playbook -i ansible/inventory ansible/deploy.yml


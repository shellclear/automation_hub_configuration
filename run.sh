#!/usr/bin/env sh

ENV="${1:-dev}"
TAGS="${2:-all}"

# Install dependencies
echo "Install ansible collections from collection/requirements.yml file"
ansible-galaxy collection install -r collections/requirements.yml

# Run priavate automation hub configuration playbook
ansible-navigator run playbook.yml \
  --eei="registry.redhat.io/ansible-automation-platform-22/ee-supported-rhel8" \
  -- \
  -e "{env: ${ENV}}" \
  -t ${TAGS}

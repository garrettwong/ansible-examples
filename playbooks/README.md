# Playbooks

Ansible enables running of playbooks.  

```bash
PLAYBOOK="GCE_instance.yaml"
ansible-playbook $PLAYBOOK -i ~/ansible-hosts
```

## Requirements

* Requires an sa-key.json file

### Pre-Requisites

* SSH onto the ans-control-node
* run ansible ping -m 
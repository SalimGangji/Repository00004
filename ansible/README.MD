# README

## Links

<https://www.arctiq.ca/our-blog/2017/2/16/ansible-jinja-warrior-loop-variable-scope/>  
<https://stackoverflow.com/questions/12078571/jinja-templates-format-a-float-as-comma-separated-currency>

## Steps

```powershell
git clone https://github.com/SalimGangji/Repository00004.git

csed --in-place=".bak" --expression="/jinja2_extensions/I s:^\#(jinja2_extensions.*):\1:gI" --expression="p" /etc/ansible/ansible.cfg

ansible-playbook Repository00004/ansible/supermarket_items_flatten.yaml
vi -R Repository00004/ansible/supermarket_items_flat.yaml

ansible-playbook Repository00004/ansible/supermarket_items_flat_manipulations.yaml

ansible-playbook Repository00004/ansible/supermarket_orders_compute.yaml
vi -R Repository00004/ansible/supermarket_orders_computed.yaml
```

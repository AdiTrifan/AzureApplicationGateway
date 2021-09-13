

az network nsg rule create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name NSG-VM-02-ALLOW-HTTP \
  --nsg-name NSG-VM-02 \
  --protocol tcp \
  --direction inbound \
  --source-address-prefix '*' \
  --source-port-range '*' \
  --destination-address-prefix 'VirtualNetwork' \
  --destination-port-range 80 \
  --access allow \
  --priority 200

az network nsg rule create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name NSG-VM-02-ALLOW-SSH \
  --nsg-name NSG-VM-02\
  --protocol tcp \
  --direction inbound \
  --source-address-prefix '*' \
  --source-port-range '*' \
  --destination-address-prefix 'VirtualNetwork' \
  --destination-port-range 22 \
  --access allow \
  --priority 100

# Deploy VM-02

az vm create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name VM-02 \
  --admin-username adminuser \
  --admin-password adminadmin123! \
  --image UbuntuLTS \
  --vnet-name AZ104-vNET \
  --nsg NSG-VM-02 \
  --subnet BACKEND-SUBNET

az vm extension set \
  --publisher Microsoft.Azure.Extensions \
  --version 2.0 \
  --name CustomScript \
  --vm-name VM-02 \
  --resource-group 1-bfb79f74-playground-sandbox \
  --settings '{"commandToExecute":"apt-get -y update && apt-get -y install apache2 && rm -rf /var/www/html && git clone https://github.com/XaaSTechnologies/AppGw-Images-Web-Server.github.io.git /var/www/html/images"}'


# NSG for VM-03
az network nsg create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name NSG-VM-03

az network nsg rule create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name NSG-VM-03-ALLOW-HTTP \
  --nsg-name NSG-VM-03 \
  --protocol tcp \
  --direction inbound \
  --source-address-prefix '*' \
  --source-port-range '*' \
  --destination-address-prefix 'VirtualNetwork' \
  --destination-port-range 80 \
  --access allow \
  --priority 200

az network nsg rule create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name NSG-VM-03-ALLOW-SSH \
  --nsg-name NSG-VM-03\
  --protocol tcp \
  --direction inbound \
  --source-address-prefix '*' \
  --source-port-range '*' \
  --destination-address-prefix 'VirtualNetwork' \
  --destination-port-range 22 \
  --access allow \
  --priority 100

# Deploy VM-03

az vm create \
  --resource-group 1-bfb79f74-playground-sandbox \
  --name VM-03 \
  --admin-username adminuser \
  --admin-password adminadmin123! \
  --image UbuntuLTS \
  --vnet-name AZ104-vNET \
  --nsg NSG-VM-03 \
  --subnet BACKEND-SUBNET



az vm extension set \
  --publisher Microsoft.Azure.Extensions \
  --version 2.0 \
  --name CustomScript \
  --vm-name VM-03 \
  --resource-group 1-bfb79f74-playground-sandbox \
  --settings '{"commandToExecute":"apt-get -y update && apt-get -y install apache2 && rm -rf /var/www/html && git clone https://github.com/XaaSTechnologies/AppGw-Video-Web-Server.github.io.git /var/www/html/video"}'


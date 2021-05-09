az network vnet create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --name vNET-A \
    --address-prefix 10.0.0.0/16 \
    --subnet-name Subnet-01-vNET-A \
    --subnet-prefix 10.0.0.0/24 \
    --location centralus

az network vnet create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --name vNET-B \
    --address-prefix 10.1.0.0/16 \
    --subnet-name Subnet-01-vNET-B \
    --subnet-prefix 10.1.0.0/24 \
    --location centralus

az network vnet create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --name vNET-C \
    --address-prefix 10.2.0.0/16 \
    --subnet-name Subnet-01-vNET-C \
    --subnet-prefix 10.2.0.0/24 \
    --location eastus

az vm create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --no-wait \
    --name VM-A \
    --location centralus \
    --vnet-name vNET-A \
    --subnet Subnet-01-vNET-A \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

az vm create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --no-wait \
    --name VM-B \
    --location centralus \
    --vnet-name vNET-B \
    --subnet Subnet-01-vNET-B \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

az vm create \
    --resource-group 1-ad7241e3-playground-sandbox \
    --no-wait \
    --name VM-C \
    --location eastus \
    --vnet-name vNET-C \
    --subnet Subnet-01-vNET-C \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

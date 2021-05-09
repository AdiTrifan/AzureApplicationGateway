az network vnet create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --name Azure-VNET \
    --address-prefix 10.0.0.0/16 \
    --subnet-name Azure-Subnet-01 \
    --subnet-prefix 10.0.0.0/24 \
    --location centralus

az network vnet subnet create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --vnet-name Azure-VNET \
    --address-prefix 10.0.255.0/27 \
    --name GatewaySubnet

az network vnet create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --name HQ-VNET \
    --address-prefix 172.20.0.0/16 \
    --subnet-name HQ-Subnet-01 \
    --subnet-prefix 172.20.0.0/24 \
    --location centralus

az network vnet subnet create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --vnet-name HQ-VNET \
    --address-prefix 172.20.255.0/27 \
    --name GatewaySubnet

az vm create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --name Azure-VM \
    --location centralus \
    --vnet-name Azure-VNET \
    --subnet Azure-Subnet-01 \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

az vm create \
    --resource-group 1-ad7241e3-playground-sandbox\
    --name HQ-VM \
    --location centralus \
    --vnet-name HQ-VNET \
    --subnet HQ-Subnet-01 \
    --image UbuntuLTS \
    --size Standard_B1s \
    --admin-username adminuser \
    --admin-password adminadmin123!

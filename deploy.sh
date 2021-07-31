RGNAME=zain-haze-bot-rg
LOCATION=ukwest
STORAGEACCNAME=zainhazebotstorageacc
FUNCAPPNAME=zain-haze-bot-funcapp 
TABLENAME=microbiturls

az group delete -n $RGNAME -y

az group create -n $RGNAME

az storage account create -n $STORAGEACCNAME -g $RGNAME --sku Standard_LRS --kind StorageV2
STORAGEACCID=$(az storage account show -n $STORAGEACCNAME --query id -o tsv)
CONNSTR=$(az storage account show-connection-string -n zainhazebotstorageacc -g zain-haze-bot-rg -o tsv)
SASTOKEN=$(az storage account generate-sas --expiry 2021-01-31 --permissions acdlpruw --resource-types sco --services t --https-only  --account-name zainhazebotstorageacc -o tsv)
TABLEENDPOINT=$(az storage account show -n zainhazebotstorageacc --query primaryEndpoints.table -o tsv)

az storage blob service-properties update --account-name $STORAGEACCNAME --static-website --index-document home.html --404-document error.html

az storage table create -n $TABLENAME  --account-name zainhazebotstorageacc --connection-string $CONNSTR


#load data
curl \
    -d "{ \"PartitionKey\":\"microbitUrl s\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_hvoF5R5g2ckx\", \"name\":\"maze\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN
curl \
    -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_HqXFbd6Kkcjb\", \"name\":\"super helli\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN
curl \
    -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_6yC4xyJtH6g3\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN
curl \
    -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_JK8TvxDAfebe\", \"name\":\"chase the pizza\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN
curl \
    -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_CV27YW4yaJpw\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN

az functionapp create -g $RGNAME -n $FUNCAPPNAME -s $STORAGEACCID --assign-identity system --consumption-plan-location ukwest --functions-version 3 --os-type Linux --runtime dotnet --disable-app-insights
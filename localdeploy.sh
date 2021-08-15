TABLEENDPOINT=http://127.0.0.1:10002/devstoreaccount1/
TABLENAME=urls

az storage table delete -n $TABLENAME
az storage table create -n $TABLENAME

SAS=$(az storage account generate-sas --account-name devstoreaccount1 \
    --account-key Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw== \
    --permissions dlpruw --resource-types s --services t --expiry 2021-08-01 -o tsv)

curl -d "{ \"PartitionKey\":\"microbit\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_hvoF5R5g2ckx\", \"name\":\"maze\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME

curl -d "{ \"PartitionKey\":\"microbit\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_HqXFbd6Kkcjb\", \"name\":\"super helli\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME

curl -d "{ \"PartitionKey\":\"microbit\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_6yC4xyJtH6g3\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME

curl -d "{ \"PartitionKey\":\"microbit\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_JK8TvxDAfebe\", \"name\":\"chase the pizza\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME

curl -d "{ \"PartitionKey\":\"microbit\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_CV27YW4yaJpw\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME
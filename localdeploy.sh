TABLEENDPOINT=http://127.0.0.1:10002/devstoreaccount1/
TABLENAME=microbiturls
SASTOKEN='?st=2021-05-20T08%3A55%3A00Z&se=2021-08-21T08%3A55%3A00Z&sp=raud&sv=2018-03-28&tn=microbiturls&sig=m8H7WyO4AMq3jJLnvMvxaP0UG6p5TpNskx%2FU5gB8NGg%3D'

curl -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_hvoF5R5g2ckx\", \"name\":\"maze\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN

curl -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_HqXFbd6Kkcjb\", \"name\":\"super helli\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN

curl -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_6yC4xyJtH6g3\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN

curl -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_JK8TvxDAfebe\", \"name\":\"chase the pizza\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN

curl -d "{ \"PartitionKey\":\"microbitUrls\", \"RowKey\":\"$(uuidgen)\", \"url\":\"https://makecode.com/_CV27YW4yaJpw\", \"name\":\"strawberry crush\"}" \
    -H "content-type:application/json" \
    -H "accept:application/json" \
    --url $TABLEENDPOINT$TABLENAME$SASTOKEN
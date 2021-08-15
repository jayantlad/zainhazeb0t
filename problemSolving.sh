curl -H "Auhtorization: SharedKey devstoreaccount1:Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==" \
    http://127.0.0.1:10002/devstoreaccount1/blah?comp=acl

-d /workspace/debug.log

docker run -p 7777:7777 -p 8888:8888 -p 9999:9999 -v c:/azurite:/workspace mcr.microsoft.com/azure-storage/azurite azurite -l /workspace
-d /workspace/debug.log --blobPort 7777 --blobHost 0.0.0.0 --queuePort 8888 --queueHost 0.0.0.0 --tablePort 9999 --tableHost 0.0.0.0 --loose
--skipApiVersionCheck

docker run -p 10000:10000 -p 10001:10001 -v c:/azurite:/data mcr.microsoft.com/azure-storage/azurite

docker run -d -p 10000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite:latest
docker run -d -p 10000:10000 -p 10001:10001 -p 10002:10002  -v c:/azurite:/workspace mcr.microsoft.com/azure-storage/azurite azurite -l /workspace -d /workspace/debug.log 


--version 2019-12-12

2019-02-02

YYYY-MM-DD

curl http://127.0.0.1:10002/devstoreaccount1/blah?st=2021-08-01T11%3A23%3A13Z&se=2021-08-02T11%3A23%3A13Z&sp=rau&sv=2018-03-28&tn=adsff&sig=T%2BDfhiugi0lNFUNIeY76pXnk9gsA59VAzmdBzM5fDj0%3D&comp=acl

Authorization: SharedKey devstoreaccount1:Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==

2020-01-24T03:56:54.818Z ce1cc537-128b-46ad-9224-b2b17443c0e9 info: BlobSharedKeyAuthenticator:validate() Calculated authentication header based on key1: SharedKey devstoreaccount1:/S7T6ds2y+Gd7wYbOo7ljAx6dJCs0ub4jjvCFkOju9s=

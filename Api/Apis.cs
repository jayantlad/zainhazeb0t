using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Microsoft.Azure.Cosmos.Table;
using System.Linq;

namespace Api
{
    public static class Apis
    {
        [FunctionName("GetUrls")]
        public static async Task<IActionResult> Get(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            try
            {
                var tableServiceClient = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=zainhazebotstorageacc;AccountKey=rMs/w+qMLp8sBrpY2DV7aMAH7oWbqIJDskAhad0wQYt2AoJUh49pbFRjtbfdBPJaTcxr82L5+6FR1lTeaumLsg==;EndpointSuffix=core.windows.net");

                var cloudTableClient = tableServiceClient.CreateCloudTableClient();

                var urlsTable = cloudTableClient.GetTableReference("microbiturls");

                var cvQuery = new TableQuery<Urls>();
                var urls = urlsTable.ExecuteQuery(cvQuery);

                var result = new { MicroBitUrls = urls.ToList() };

                return new OkObjectResult(result);
            }
            catch (Exception e)
            {
                log.LogError(e.StackTrace);
            }
            return new BadRequestResult();
        }
        /*
        [FunctionName("PostUrl")]
        public static async Task<IActionResult> Post(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            try
            {
                var tableServiceClient = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=zainhazebotstorageacc;AccountKey=rMs/w+qMLp8sBrpY2DV7aMAH7oWbqIJDskAhad0wQYt2AoJUh49pbFRjtbfdBPJaTcxr82L5+6FR1lTeaumLsg==;EndpointSuffix=core.windows.net");

                var cloudTableClient = tableServiceClient.CreateCloudTableClient();

                var urlsTable = cloudTableClient.GetTableReference("microbitUrls");

                TableOperation.InsertOrMerge();

                var cvQuery = new TableQuery<Urls>();

                var urls = urlsTable.ExecuteQuery(cvQuery);

                return new OkObjectResult(new { MicroBitUrls = urls.ToList() });
            }
            catch (Exception e)
            {
                log.LogError(e.StackTrace);
            }
            return new BadRequestResult();
        }*/

    }
}

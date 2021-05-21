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
using Microsoft.Extensions.Configuration;

namespace Api
{
    public class Apis
    {
        private readonly IConfiguration _configuration;

        public Apis(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [FunctionName("GetUrls")]
        public async Task<IActionResult> Get(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            try
            {
                var tableServiceClient = CloudStorageAccount.Parse(_configuration["AzureWebJobsStorage"]);

                var cloudTableClient = tableServiceClient.CreateCloudTableClient();

                var urlsTable = cloudTableClient.GetTableReference("microbiturls");

                var cvQuery = new TableQuery<Urls>();
                var urls = urlsTable.ExecuteQuery(cvQuery);

                var result = new { urls = urls.ToList() };

                return new OkObjectResult(result);
            }
            catch (Exception e)
            {
                log.LogError(e.StackTrace);
            }
            return new BadRequestResult();
        }

        [FunctionName("PostNewGame")]
        public async Task<IActionResult> Post(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            try
            {
                var requestBody = new StreamReader(req.HttpContext.Request.Body);
                var body = await requestBody.ReadToEndAsync();
                var data = JsonConvert.DeserializeObject<Urls>(body);

                data.RowKey = Guid.NewGuid().ToString();

                var tableServiceClient = CloudStorageAccount.Parse(_configuration["AzureWebJobsStorage"]);

                var cloudTableClient = tableServiceClient.CreateCloudTableClient();

                var urlsTable = cloudTableClient.GetTableReference("microbitUrls");

                var tableOperation = TableOperation.InsertOrMerge(data);

                await urlsTable.ExecuteAsync(tableOperation);

                return new OkObjectResult(new { MicroBitUrl = data });
            }
            catch (Exception e)
            {
                log.LogError(e.StackTrace);
            }
            return new BadRequestResult();
        }
    }
}

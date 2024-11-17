using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;

namespace TestRetryAttribute.Functions;

public class RetryableTrigger(ILogger<RetryableTrigger> logger)
{
    [Function("RetryableTrigger")]
    public HttpResponseData Run([HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequestData req)
    {

        logger.LogInformation("C# HTTP trigger function processed a request.");
        return req.CreateResponse(System.Net.HttpStatusCode.OK);
    }
}


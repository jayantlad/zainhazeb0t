using Microsoft.Azure.Cosmos.Table;
using System;
using System.Collections.Generic;
using System.Text;

namespace Api
{
    public class Urls : TableEntity
    {
        public string url { get; set; }
        public string name { get; set; }
    }
}

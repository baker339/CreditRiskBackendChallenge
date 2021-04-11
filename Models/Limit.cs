using System.ComponentModel.DataAnnotations;

namespace CreditRiskBackendChallenge.Models
{
    public class Limit
    {
        public string bankName { get; set; }

        public int rating { get; set; }

        public decimal assets { get; set; }

        public decimal calculatedLimit { get; set; }

        public string lastUpdatedDateTime { get; set; }
    }
}

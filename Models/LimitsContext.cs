using System;
using System.Collections.Generic;
using CreditRiskBackendChallenge.Models;
using MySqlConnector;

namespace NetCoreWebApp.Models
{
    public class LimitsContext
    {
        public string ConnectionString { get; set; }

        public LimitsContext(string connectionString)
        {
            this.ConnectionString = connectionString;
        }

        private MySqlConnection GetConnection()
        {
            return new MySqlConnection(ConnectionString);
        }

        public List<Limit> GetLimits()
        {
            List<Limit> list = new List<Limit>();

            using (MySqlConnection conn = GetConnection())
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("call getCalculatedLimit()", conn);

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        list.Add(new Limit()
                        {
                            bankName = reader["bankName"].ToString(),
                            rating = Convert.ToInt32(reader["rating"]),
                            assets = Convert.ToDecimal(reader["assets"]),
                            calculatedLimit = Convert.ToDecimal(reader["calculatedLimit"]),
                            lastUpdatedDateTime = reader["lastUpdatedDateTime"].ToString()
                        });
                    }
                }
            }

            Console.Write(list);
            
            return list;
        }
    }
}
using System.Data;
using System.Data.SqlClient;
using OrderAPI.Models.Domain;

namespace OrderAPI.Data
{
    public class clsOrders : Connection
    {
        //public int? ACKId, SLIC, SPanCard, SITR, SOther, IDPanCard, IDAadharCard, IDElectionCard, IDDrivingLic, IDPassport, IDOther, ADrivingLic, AElectionCard, APassport, ALightBill, APostPaidBill, APassbook, AOther, IITR, ISalarySlip, ISalaryCertificate, IIssueByCompany, IForm16, IBankStatement, IOther, EntryByAdminId, EntryByUserId, AAadharCard, SPassport, CustomerId;
        //public string EmpName, InwardPersonName, InwardNumber, ReceiverPersonName, CustomerName, Address, Mobile, Email, Action, AreaName;
        //public DateTime? ACKDate;
        //public double? Amount;
        //public int? Mrg, BBirthCertificate, BSchoolLC, BSchoolTC, BAllEdu;
        //public string Other1, Other2, Other3, Other4, Other5;

        public List<Orders> fnGetOrders()
        {
            List<Orders> orders = new List<Orders>();
            try
            {                
                Connect();
                cmd.Connection = con;
                cmd.CommandText = "sp_GetOrders";
                cmd.CommandType = CommandType.StoredProcedure;               
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
              
                disconnect();
                Orders order;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    order = new Orders();
                    order.OrderId = Convert.ToString(dt.Rows[i]["OrderId"]);
                    order.CustomerId = Convert.ToString(dt.Rows[i]["CustomerId"]);
                    order.OrderDate = Convert.ToString(dt.Rows[i]["OrderDate"]);
                    order.TotalAmount = Convert.ToString(dt.Rows[i]["TotalAmount"]);
                    orders.Add(order);
                }
                return orders;
            }
            catch (Exception ex)
            {
                throw ex;
                //return orders;
            }
        }

        public List<Orders> fnGetOrders(int CustomerId,DateTime FromDate,DateTime ToDate)
        {
            List<Orders> orders = new List<Orders>();
            try
            {
                Connect();
                cmd.Connection = con;
                cmd.CommandText = "sp_GetFilteredOrders";
                cmd.Parameters.AddWithValue("CustomerId", CustomerId);
                cmd.Parameters.AddWithValue("FromDate", FromDate);
                cmd.Parameters.AddWithValue("ToDate", ToDate);
                cmd.CommandType = CommandType.StoredProcedure;
                da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                disconnect();
                Orders order;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    order = new Orders();
                    order.OrderId = Convert.ToString(dt.Rows[i]["OrderId"]);
                    order.CustomerId = Convert.ToString(dt.Rows[i]["CustomerId"]);
                    order.OrderDate = Convert.ToString(dt.Rows[i]["OrderDate"]);
                    order.TotalAmount = Convert.ToString(dt.Rows[i]["TotalAmount"]);
                    orders.Add(order);
                }
                return orders;
            }
            catch (Exception ex)
            {
                throw ex;
                //return orders;
            }
        }
    }
}

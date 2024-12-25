using System.Data;
using System.Data.SqlClient;

namespace OrderAPI.Data
{
    public class Connection
    {
        public SqlConnection con;
        public SqlCommand cmd;
        public SqlDataAdapter da;
        public DataSet ds;
        public DataTable dt;


        public void Connect()
        {
            con = new SqlConnection(ConfigurationManager.AppSetting["ConnectionStrings:Value"]);
            cmd = new SqlCommand();
            SqlConnection.ClearPool(con);

            con.Open();

            da = new SqlDataAdapter();
            ds = new DataSet();
        }
        public void disconnect()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}

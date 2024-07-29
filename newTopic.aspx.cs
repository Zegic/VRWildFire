using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace Final
{
    public partial class newTopic : System.Web.UI.Page
    {
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
{


    SqlConnection SunCon = new SqlConnection(myConnectionString);
    SunCon.Open();
    string topicname = TextBox1.Text.Trim();
    if (string.IsNullOrEmpty(topicname)) {
    // null
        Response.Write("<Script language='javascript'>alert('话题不能为空')</Script>");
        Response.Redirect("HomePage.aspx");
    }
    else
    {
        string cmd = " execute CreateTopic @topicname =[" + topicname + "];";
        SqlCommand createTableCmd = new SqlCommand(cmd, SunCon);
        createTableCmd.ExecuteNonQuery();
        SunCon.Close();
        Session["topicname"] = topicname;
        Session["topic"] = get_topicID_by_tpcName(topicname);
        if (Session["topic"] != null)
        {
            Response.Redirect("mainForm.aspx");
        }
        else
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}
        protected string get_topicID_by_tpcName(string input)
        {
                string query = "SELECT TopicID FROM Topic WHERE topicname = @Message;";
                using (SqlConnection connection = new SqlConnection(myConnectionString))
                {
                    string messageText = input;
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Message", messageText);
                    connection.Open();

                    object result = command.ExecuteScalar(); // 执行查询并返回查询结果的第一行第一列，忽略其他列或行

                    if (result != null)
                    {
                        return Convert.ToInt32(result).ToString();
                        // 如果结果不为空，转换为int并返回
                        // topicid = Convert.ToInt32(result);
                    }
                    else {
                        return null;
                    }
                }
            
        }



    }
}
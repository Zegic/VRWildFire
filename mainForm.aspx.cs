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
    public partial class mainForm : System.Web.UI.Page
    {
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
      //  int topicid = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //topicid = int.Parse(Session["topic"].ToString());
                load_gridview2();
        }


        protected void get_topicID_by_tpcName() {
            if (Session["topic"] != null)
            {
                string query = "SELECT TopicID FROM Topic WHERE topicname = @Message;";
                using (SqlConnection connection = new SqlConnection(myConnectionString))
                {
                    string messageText = Session["topic"].ToString();
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Message", messageText);
                    connection.Open();

                    object result = command.ExecuteScalar(); // 执行查询并返回查询结果的第一行第一列，忽略其他列或行

                    if (result != null)
                    {
                        // 如果结果不为空，转换为int并返回
                       // topicid = Convert.ToInt32(result);
                    }
                }
            }
        }


        //缺少topicid载入
        protected void load_gridview2() {
            SqlConnection SunCon = new SqlConnection(myConnectionString);
            SunCon.Open();
            string StuSQL3;
           // StuSQL3 = "SELECT * FROM dbo.MainForumByTopic([" + Session["topic"].ToString() + "])";
            StuSQL3 = "select * from MainForum where TopicID = " + Session["topic"].ToString();
            SqlCommand StuIns = new SqlCommand(StuSQL3, SunCon);
            SqlDataReader SunDa = StuIns.ExecuteReader();
            GridView1.DataSource = SunDa;
            GridView1.DataBind();
            SunCon.Close();
        }

        protected void load_gridview()
        {
            SqlConnection SunCon = new SqlConnection(myConnectionString);
            SunCon.Open();
            string StuSQL3;
            if (Session["topic"] != null)
            {
                // StuSQL3 = "SELECT top 50 * FROM [" + Session["topic"] + "] order by ID DESC";
                StuSQL3 = "SELECT top 100 * FROM [" + Session["topic"] + "] order by ID";
            }
            else
            {
                /// StuSQL3 = "SELECT top 50 * FROM mainDiscuss order by ID DESC";
                StuSQL3 = "SELECT top 100 * FROM mainDiscuss order by ID";
            }
            SqlCommand StuIns = new SqlCommand(StuSQL3, SunCon);
            SqlDataReader SunDa = StuIns.ExecuteReader();
            GridView1.DataSource = SunDa;
            GridView1.DataBind();
            SunCon.Close();
        }

        protected void Button_userInputType_Click(object sender, EventArgs e)
        {
            String comment;
            comment = Request.Form["Text_userInputType"];
            //if (comment.)
            if (string.IsNullOrEmpty(comment))
            {
                // null
                Response.Write("<Script language='javascript'>alert('评论不能为空')</Script>");
                Response.Redirect("mainForm.aspx");
            }
            else
            {
                if (Session["topic"] != null)
                {
                    if (Session["username"] != null)
                    {
                        //还没做topicid 先让id=1
                        DateTime now = DateTime.Now;
                        string nowString = now.ToString("yyyy-MM-dd");
                        comment = comment + "【" + nowString + "】";

                        string commandText = " execute insertintomainforum @username,@message,@topicid;";
                        using (SqlConnection connection = new SqlConnection(myConnectionString))
                        {
                            using (SqlCommand command = new SqlCommand(commandText, connection))
                            {
                                command.Parameters.AddWithValue("@username", Session["username"]);
                                command.Parameters.AddWithValue("@message", comment);
                                command.Parameters.AddWithValue("@topicid", Session["topic"]);
                                connection.Open();
                                command.ExecuteNonQuery();
                            }
                        }
                        Response.Redirect("mainForm.aspx");
                    }
                }
            }
        }
     }
}
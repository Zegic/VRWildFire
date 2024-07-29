using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;


namespace Final
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        protected void Button_login_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(myConnectionString);
            string username = TextBox_username.Text;
            string passwd = TextBox_passwd.Text;
            String hashpd = CalculateSHAHash(passwd);
            String hashUsername = CalculateSHAHash(username);

            string mySql = "select * from Account where username='" + hashUsername + "' and " + "passwd='" + hashpd + "'";
            SqlCommand myCommand = new SqlCommand(mySql, myConn);
            myConn.Open();
            SqlDataReader myDr = myCommand.ExecuteReader();
            if (myDr.Read())
            {
                Session["username"] = TextBox_username.Text;
                if (hashUsername == "d033e22ae348aeb5660fc2140aec35850c4da997")//“admin”的hash值.记得密码是qwe
                {
                    Session["adminis"] = "yes";
                    Response.Redirect("Admind033e.aspx");
                }
                Response.Redirect("HomePage.aspx");
            }
            else {
                Response.Write("<Script language='javascript'>alert('登录失败，用户名或密码错误')</Script>");
            }
            myDr.Close();
            myConn.Close();
        }

        public static string CalculateSHAHash(string input)
        {
            using (SHA1 sha1 = SHA1.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(input);
                byte[] hashBytes = sha1.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2")); // 使用 "x2" 格式将每个字节转换为16进制字符串
                }

                return sb.ToString();
            }
        }
    }
}
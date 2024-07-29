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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        protected void Button_register_Click(object sender, EventArgs e)
        {
            if (TextBox_passwd1.Text == TextBox_passwd2.Text)
            {
                if (TextBox_username != null){
            String username;
            String passwd;
            username = TextBox_username.Text;
            passwd = TextBox_passwd1.Text;
            String hashpd = CalculateSHAHash(passwd);
            String hashUsername = CalculateSHAHash(username);
            SqlConnection SunCon = new SqlConnection(myConnectionString);
            SunCon.Open();
            string commits;
                //判断是不是有同名
            string exist;
            exist = "select * from Account where username='" + hashUsername +"'";
            SqlCommand lfexist = new SqlCommand(exist, SunCon);
            SqlDataReader myDr = lfexist.ExecuteReader();
            if (!myDr.Read())
            {
                SunCon.Close();
                //结束判断同名
                SunCon.Open();
                commits = "INSERT INTO Account(username,passwd) VALUES('" + hashUsername + "','" + hashpd + "')";
                SqlCommand StuIns = new SqlCommand(commits, SunCon);
                StuIns.ExecuteNonQuery();
                SunCon.Close();
                Response.Redirect("login.aspx");

            }//结束if判断同名
            else {
                SunCon.Close();
                Response.Write("<Script language='javascript'>alert('重名了，换个名字去吧')</Script>");
            }

                }else {
                Response.Write("<Script language='javascript'>alert('用户名不能空')</Script>");
                }
            }
            else { 
                 Response.Write("<Script language='javascript'>alert('两次输入密码不一致')</Script>");
            }
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
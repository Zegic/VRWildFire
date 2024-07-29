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
    public partial class createSecert : System.Web.UI.Page
    {
       // private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
{


    string topicPasswd = TextBox1.Text.Trim();
    if (string.IsNullOrEmpty(topicPasswd)) {
    // null
        Response.Write("<Script language='javascript'>alert('密码不能为空')</Script>");
        Response.Redirect("createSecert.aspx");
    }
    else
    {
        //下面的全都要改成创建加密论坛

        //设想：
        //以hhhash（三重哈希）存储到数据库。
        //hhhash就是key，得到hhhhash先判断数据库是否有hhhash，如果有就把session改成hhash（双重），hhash用于加解密
        //在判断用户进入hhhash之后，所有的话题都用hhhash标记头
        //string cmd = " execute CreateTopic @topicname =[" + topicPasswd + "];";

        string keyHash = gethash(topicPasswd);
        string keyHHash = gethash(keyHash);
        string keyHHHash = gethash(keyHHash);

        //在这里给用户发一个session作为密钥。这里无需进入数据库。

        Session["keyHHHash"] = keyHHHash; //用于当作ID
        Session["keyHHash"] = keyHHash;     //用于加密

        Response.Redirect("SecertForm.aspx");
    }
}


        static string gethash(string rawData)
        {
            // 创建一个SHA256对象  
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // 计算输入字符串的哈希值  
                byte[] bytes = Encoding.UTF8.GetBytes(rawData);
                byte[] hashValue = sha256Hash.ComputeHash(bytes);

                // 将字节转换为十六进制字符串  
                StringBuilder hex = new StringBuilder(hashValue.Length * 2);
                foreach (byte b in hashValue)
                {
                    hex.AppendFormat("{0:x2}", b);
                }

                // 返回十六进制字符串  
                return hex.ToString();
            }
        }

        static string gethhash(string rawData) {
            return gethash(gethash(rawData));
        }

        static string gethhhash(string rawData)
        {
            return gethash(gethash(gethash(rawData)));
        }


    }
}
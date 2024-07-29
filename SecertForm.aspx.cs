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
using System.IO;
namespace Final
{

    public class ChatMessage
    {
        //public string HHHash { get; set; }
        public string Username { get; set; }
        public string Message { get; set; }
    }


    public partial class SecertForm : System.Web.UI.Page
    {
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        //  int topicid = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            //topicid = int.Parse(Session["topic"].ToString());
            load_gridview2();
        }




        //缺少topicid载入

        protected void load_gridview2()
        {
            using (SqlConnection SunCon = new SqlConnection(myConnectionString))
            {
                SunCon.Open();

                // 检查keyHHHash是否存在于encChat表中  
                string checkSQL = "SELECT 1 FROM encChat WHERE hhhash = @keyHHHash";
                using (SqlCommand checkCmd = new SqlCommand(checkSQL, SunCon))
                {
                    checkCmd.Parameters.AddWithValue("@keyHHHash", Session["keyHHHash"].ToString());
                    object result = checkCmd.ExecuteScalar();

                    if (result != null)
                    {

                        List<ChatMessage> decryptedMessages = new List<ChatMessage>();

                        string readSQL = "SELECT * FROM encChat WHERE hhhash = @keyHHHash";
                        using (SqlCommand readCmd = new SqlCommand(readSQL, SunCon))
                        {
                            readCmd.Parameters.AddWithValue("@keyHHHash", Session["keyHHHash"].ToString());
                            using (SqlDataReader SunDa = readCmd.ExecuteReader())
                            {
                                while (SunDa.Read())
                                {
                                    //string hhhash = SunDa["hhhash"].ToString();
                                    string encryptedUsername = SunDa["enc_username"].ToString();
                                    string encryptedMessage = SunDa["enc_message"].ToString();

                                    byte[] keye = GenerateAesKeyFromPassword(Session["keyHHash"].ToString());
                                    string decryptedUsername = decrypt_AES_ECB(encryptedUsername, keye);
                                    string decryptedMessage = decrypt_AES_ECB(encryptedMessage, keye);

                                    // 将解密后的数据添加到列表中  
                                    ChatMessage chatMessage = new ChatMessage
                                    {
                                        //HHHash = hhhash,
                                        Username = decryptedUsername,
                                        Message = decryptedMessage
                                    };
                                    decryptedMessages.Add(chatMessage);
                                }
                            }
                        }

                        // 将解密后的消息列表绑定到GridView  
                        GridView1.DataSource = decryptedMessages;
                        GridView1.DataBind();



                    }
                    else
                    {
                        // 如果不存在，则插入新的记录（此处假设你已经有了要插入的数据）  
                        string insertSQL = "INSERT INTO encChat (hhhash) VALUES (@keyHHHash)"; // 替换...为具体的字段名和值  
                        using (SqlCommand insertCmd = new SqlCommand(insertSQL, SunCon))
                        {
                            insertCmd.Parameters.AddWithValue("@keyHHHash", Session["keyHHHash"].ToString());
                            //insertCmd.Parameters.AddWithValue("@name", "".ToString());
                            //insertCmd.Parameters.AddWithValue("@messgae", "".ToString());

                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
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
                Response.Redirect("SecertForm.aspx");
            }
            else
            {

                //还没做topicid 先让id=1
                DateTime now = DateTime.Now;
                string nowString = now.ToString("yyyy-MM-dd");
                comment = comment + "【" + nowString + "】";
                string username = Session["username"].ToString();
                //秘密论坛不显示精确时间

                byte[] key = GenerateAesKeyFromPassword(Session["keyHHash"].ToString());  //注意，以2次哈希值作为密钥的口令

                string encusername = encrypt_AES_ECB(username, key);
                string encmessage = encrypt_AES_ECB(comment, key);

                string commandText = " INSERT INTO encChat (hhhash,enc_username,enc_message) VALUES (@keyHHHash,@username,@message)";
                using (SqlConnection connection = new SqlConnection(myConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(commandText, connection))
                    {
                        command.Parameters.AddWithValue("@keyHHHash", Session["keyHHHash"].ToString());
                        command.Parameters.AddWithValue("@username", encusername);
                        command.Parameters.AddWithValue("@message", encmessage);
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
                Response.Redirect("SecertForm.aspx");
            }
        }

        //加密函数
        public static string encrypt_AES_ECB(string plainText, byte[] Key)
        {
            
            byte[] encrypted;
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.Mode = CipherMode.ECB;
                aesAlg.Padding = PaddingMode.PKCS7;

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }

            return Convert.ToBase64String(encrypted);
        }


        //解密函数
        public static string decrypt_AES_ECB(string base64cipherText, byte[] Key)
        {
            byte[] cipherText = Convert.FromBase64String(base64cipherText);

            // if (cipherText == null || cipherText.Length <= 0)
            //    throw new ArgumentNullException();
            // if (Key == null || Key.Length <= 0)
            //    throw new ArgumentNullException();

            string plaintext = null;
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Key;
                aesAlg.Mode = CipherMode.ECB;
                aesAlg.Padding = PaddingMode.PKCS7;

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msDecrypt = new MemoryStream(cipherText))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            plaintext = srDecrypt.ReadToEnd();
                        }
                    }
                }
            }

            return plaintext;
        }


        // 生成AES密钥的函数  
        public static byte[] GenerateAesKeyFromPassword(string password, int keySize = 256)
        {
            byte[] salt = System.Text.Encoding.UTF8.GetBytes("chanbchanbchanb");
            using (var rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, salt))
            {
                return rfc2898DeriveBytes.GetBytes(keySize / 8);
            }
        }

        // 将字节数组转换为Base64字符串  
        public static string ByteArrayToBase64String(byte[] byteArrayIn)
        {
            return Convert.ToBase64String(byteArrayIn);
        }

        // 将Base64字符串转换为字节数组  
        public static byte[] Base64StringToByteArray(string base64In)
        {
            return Convert.FromBase64String(base64In);
        }





        // 如果存在，则读取数据到GridView  
        //           string readSQL = "SELECT * FROM encChat WHERE hhhash like @keyHHHash";
        //        using (SqlCommand readCmd = new SqlCommand(readSQL, SunCon))
        //     {
        //       readCmd.Parameters.AddWithValue("@keyHHHash", Session["keyHHHash"].ToString());
        //    using (SqlDataReader SunDa = readCmd.ExecuteReader())
        //   {
        //        GridView1.DataSource = SunDa;
        //           GridView1.DataBind();
        //          }
        //        }







    }
}
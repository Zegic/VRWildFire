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
    public partial class HomePage : System.Web.UI.Page
    {
        private string myConnectionString = ConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection SunCon = new SqlConnection(myConnectionString))
            {
                SunCon.Open();

                string StuSQL4 = "select * from viewtopic order by topicid desc";
                SqlCommand StuIns = new SqlCommand(StuSQL4, SunCon);
                SqlDataReader SunDa = StuIns.ExecuteReader();
                GridView_homepage_allFs.DataSource = SunDa;
                GridView_homepage_allFs.DataBind();
                SunDa.Close();

                string cmd = "select top 5 * from mainforum order by id desc";
                SqlCommand cmds = new SqlCommand(cmd, SunCon);
                SqlDataReader cmdr = cmds.ExecuteReader();
                GridView_newmessage.DataSource = cmdr;
                GridView_newmessage.DataBind();
                cmdr.Close();

                SunCon.Close();
            }
        }

        protected void GridView_homepage_allFs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "gotoTopic")
            {
                // 获取点击按钮的行索引
                int index = Convert.ToInt32(e.CommandArgument);

                // 从GridView中获取相应的行
                GridViewRow selectedRow = GridView_homepage_allFs.Rows[index];

                // 假设需要的内容在该行的第2个单元格中（改变这个索引以匹配你的需要,从0开始的）
                string topic = selectedRow.Cells[1].Text;
                string topicname = selectedRow.Cells[2].Text;
                // 将话题存入Session
                Session["topic"] = topic;
                Session["topicname"] = topicname;
                Response.Redirect("mainForm.aspx");
               // Response.Write("<script>alert('" + Session["topic"].ToString() + "');</script>");
            }
        }

        protected void GridView_newmessage_allFs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "gotoTopic2")
            {
                // 获取点击按钮的行索引
                int index = Convert.ToInt32(e.CommandArgument);

                // 从GridView中获取相应的行
                GridViewRow selectedRow = GridView_newmessage.Rows[index];

                // 假设需要的内容在该行的第2个单元格中（改变这个索引以匹配你的需要,从0开始的）
                string topic = selectedRow.Cells[1].Text;
                //string topicname = selectedRow.Cells[].Text;
                // 将话题存入Session
                Session["topic"] = topic;
                //Session["topicname"] = topicname;
                Response.Redirect("mainForm.aspx");
                // Response.Write("<script>alert('" + Session["topic"].ToString() + "');</script>");
            }
        }

        protected void Button_create_Click(object sender, EventArgs e)
        {
            Response.Redirect("newTopic.aspx");
        }
    }
}
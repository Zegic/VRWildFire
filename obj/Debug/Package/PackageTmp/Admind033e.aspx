<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admind033e.aspx.cs" Inherits="Final.Admind033e" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<div class="upLan">
		<div class="logo"><asp:Image ID="Image1" runat="server" Height="48px" 
                ImageUrl="~/Pictures/wildfireLOGO.png" Width="49px" /></div>
		<div class="says"> 地火论坛！</div>
		<div class="spaces">
			<div class="button1"><a href="login.aspx">退出登录</a></div>
			<div class="button2"><a href="Secert.aspx">进入秘密论坛</a></div>
			<div class="button3"><%= Session["username"] %>，<br/>欢迎来到地火！</div>
		</div>

		<div class="user"><asp:Image ID="Image2" runat="server" Height="48px" 
                ImageUrl="~/Pictures/userLOGO.jpg" Width="49px" /></div>
	</div>
	<div class="mainpane">
		<div class="friend">
        
        这里应该是好友栏，<br/>
        但是我没有做！

        </div>
		<div class="comment">
			<div class="speechPane">
            <br/>
            <p></p>
            <form id="form_homepage" runat="server">
            <asp:Button ID="Button_create" runat="server" Text="创建话题" 
                onclick="Button_create_Click" />
                <p></p>
                 <asp:GridView ID="GridView_homepage_allFs"  runat="server" 
              ShowHeader="False" 
              onrowcommand="GridView_homepage_allFs_RowCommand"
              >
                 <Columns>
               <asp:ButtonField Text="进入话题" CommandName="gotoTopic" />
                     <asp:ButtonField CommandName="DELETETABLE" Text="删除该话题" />
                 </Columns>
                    </asp:GridView>
                 </form>
            </div>
		</div>
		<div class="info">
        这里是地火！<br/>
        太阳地下没有新鲜事！<br/>
        所以我们是地火。<br/>
        地火浏览指引：<br/>
        点击进入话题，开始畅聊吧！<br/>
        或者点击进入<a href="Secert.aspx">秘密论坛</a><br/>        
        
        </div>
	</div>
	<style>
		html,body{
			padding:0;
			margin:0;
			width:100%;
			height:100%;
		}
		body{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 1);
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:99%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.upLan{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.6);
			box-shadow:#126F1B 5px 5px 10px;
			border:1px solid rgba(21, 255, 0, 1);
			border-top:1px solid rgba(21, 255, 0, 1);
			border-bottom:1px solid rgba(21, 255, 0, 1);
			border-left:1px solid rgba(21, 255, 0, 1);
			border-right:1px solid rgba(21, 255, 0, 1);
			border-radius:5px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:sticky;
			top:nullpx;
			left:nullpx;
			right:nullpx;
			bottom:nullpx;
			height:50px;
			width:100%;
			padding:0px 0px 0px 0px;
			margin:15px 10px 15px 10px;
			flex-direction:row;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.logo{
			box-sizing:border-box;
			border-radius:5px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			flex-shrink:0;
			display:flex;
			position:relative;
			width:49px;
			height:48px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.says{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.6);
			font-size:30px;
			font-weight:normal;
			font-style:normal;
			color:rgba(205, 14, 14, 1);
			text-align:left;
			flex-shrink:0;
			display:flex;
			position:relative;
			width:200px;
			height:49%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.spaces{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.5);
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			flex-direction:row;
			justify-content:space-around;
			align-items:flex-start;
		}
		.button1
		{
		    font-size:15px;
			box-sizing:border-box;
			font-weight:normal;
			font-style:normal;
			color:rgba(64, 255, 0, 1);
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.button2
		{
		    font-size:25px;
			box-sizing:border-box;
			font-weight:normal;
			font-style:normal;
			color:rgba(64, 255, 0, 1);
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.button3
		{
		    font-size:15px;
			font-weight:normal;
			font-style:normal;
			box-sizing:border-box;
			color:rgba(64, 255, 0, 1);
			text-align:right;
			display:inline-block;
			position:relative;
			margin-left:auto;
			width:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.user{
			box-sizing:border-box;
			font-weight:normal;
			font-style:normal;
			color:rgba(0, 0, 0, 1);
			text-align:left;
			flex-shrink:0;
			display:flex;
			position:relative;
			width:49px;
			height:48px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.mainpane{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 1);
			border-radius:20px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:89%;
			padding:0px 0px 0px 0px;
			margin:0px 10px 0px 0px;
			flex-direction:row;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.friend{
             padding: 10px;
		    color: red;
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.5);
			border:2px solid rgba(255, 0, 0, 1);
			border-top:2px solid rgba(255, 0, 0, 1);
			border-bottom:2px solid rgba(255, 0, 0, 1);
			border-left:2px solid rgba(255, 0, 0, 1);
			border-right:2px solid rgba(255, 0, 0, 1);
			border-radius:20px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:400px;
			height:100%;
			margin:0px 0px 5px 0px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.comment{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 1);
			border-radius:20px;
			font-weight:normal;
			font-style:normal;
			color:rgba(24, 199, 30, 1);
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			margin:0px 5px 0px 5px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.speechPane{
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.7);
			border:2px solid rgba(38, 255, 0, 1);
			border-top:2px solid rgba(38, 255, 0, 1);
			border-bottom:2px solid rgba(38, 255, 0, 1);
			border-left:2px solid rgba(38, 255, 0, 1);
			border-right:2px solid rgba(38, 255, 0, 1);
			border-radius:10px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			margin:0px 0px 5px 0px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:center;
			overflow:hidden scroll;
		}
		.info
		{
		    padding: 10px;
		    color: lightblue;

			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.5);
			border:2px solid rgba(0, 140, 255, 1);
			border-top:2px solid rgba(0, 140, 255, 1);
			border-bottom:2px solid rgba(0, 140, 255, 1);
			border-left:2px solid rgba(0, 140, 255, 1);
			border-right:2px solid rgba(0, 140, 255, 1);
			border-radius:20px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:400px;
			height:100%;
			margin:0px 0px 5px 0px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
	</style>
</body>
</html>

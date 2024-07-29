<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newTopic.aspx.cs" Inherits="Final.newTopic" %>

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
			<div class="button1"><a href="login.aspx" style="color: red;">退出登录</a></div>
			<div class="button2"><a href="HomePage.aspx" style="color: red;">返回主页</a></div>
			<div class="button3"><%= Session["username"] %>，<br/>欢迎来到地火！</div>
		</div>

		<div class="user"><asp:Image ID="Image2" runat="server" Height="48px" 
                ImageUrl="~/Pictures/userLOGO.jpg" Width="49px" /></div>
	</div>
	<div class="mainpane">
		<div class="comment">
			<div class="speechPane">
               <form id="form1" runat="server">
                 <div class=big>
                 话题名字
                 <br/>
                     <asp:TextBox ID="TextBox1"  height="50px" style="font-size: 30px;"  runat="server"></asp:TextBox>
                <br />
                 <br />
                     <asp:Button ID="Button_createtable" runat="server" height="40px" Width="140px" style="font-size: 30px;" Text="创建话题" onclick="Button1_Click" />
                <br />
                 <br />
                    取消创建，返回主页<a href="HomePage.aspx" >点击取消</a>
                    <br />
                    <br />
                      或者点击<a href="Secert.aspx" >这里</a>，进入秘密论坛
              </div>
              </form>
            </div>
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
		.big
		{
		    font-size:40px;
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
		    font-size:25px;
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
		    font-size:40px;
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
		.comment
		{
		    font-size:25px;
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
	</style>
</body>
</html>

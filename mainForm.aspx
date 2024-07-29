<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainForm.aspx.cs" Inherits="Final.mainForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我们是地火！论坛主页</title>
</head>
<body>

	<div class="upLan">
		<div class="logo"><asp:Image ID="Image1" runat="server" Height="48px" 
                ImageUrl="~/Pictures/wildfireLOGO.png" Width="49px" /></div>
		<div class="says"> 地火论坛！</div>
		<div class="spaces">
			<div class="button1"><a href="login.aspx" style="color: red;" >退出登录</a></div>
			<div class="button2"><a href="HomePage.aspx" style="color: red;" >回到主页</a></div>
			<div class="button3"><%= Session["username"] %>，<br/>欢迎来到地火！</div>
		</div>

		<div class="user"><asp:Image ID="Image2" runat="server" Height="48px" 
                ImageUrl="~/Pictures/userLOGO.jpg" Width="49px"  /></div>
	</div>
	<div class="mainpane">
		<div class="info"> <div>你现在位于话题：[<%= Session["topicname"] %>]中</div></div>
		<div class="comment">
			<div class="speechPane">
                 <form id="form1" runat="server">
                 <asp:GridView ID="GridView1" runat="server"  CssClass="gridview-style" AutoGenerateColumns="False">
                     <Columns>
                         <asp:BoundField DataField="username" HeaderText="用户名" />
                         <asp:BoundField DataField="message" HeaderText="评论" />
                     </Columns>
                 </asp:GridView>

                 

			</div>
			<div class="type">
                <textarea id="Text_userInputType" style="font-size: 30px;" runat="server" ></textarea>
                    <asp:Button ID="Button_userInputType" runat="server" Text="提交评论"  style="font-size: 30px;"
                        onclick="Button_userInputType_Click" Height="56px" Width="128px" />
            </div>

            </form>

		</div>
	</div>



	<style>
	    
	    #Text_userInputType {
        width: 99%;
        height: 129px;
        overflow: auto;
        resize: none;
      }
	    
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
		.big-button 
		{
		    font-size: 40px;
           padding: 12px 24px;
        }
		
	    .big-text
    	{
	    font-size: 30px;
	    }
		.gridview-style {
        font-size: 39px; 
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
		    font-size:30px;
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
			color:rgba(255, 255, 255, 255);
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
			height: calc(100% - 51px);
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
			border-bottom:none;
			border-left:2px solid rgba(38, 255, 0, 1);
			border-right:2px solid rgba(38, 255, 0, 1);
			border-radius:10px 10px 0px 0px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
			overflow:hidden scroll;
		}
		.speech{
			box-sizing:border-box;
			border:1px solid rgba(89, 255, 0, 1);
			border-top:1px solid rgba(89, 255, 0, 1);
			border-bottom:1px solid rgba(89, 255, 0, 1);
			border-left:1px solid rgba(89, 255, 0, 1);
			border-right:1px solid rgba(89, 255, 0, 1);
			border-radius:10px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			height:200px;
			width:98%;
			padding:2px 2px 2px 2px;
			margin:9px 4px 2px 10px;
			flex-direction:row;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.userinfo{
			box-sizing:border-box;
			border:1px solid rgba(128, 128, 128, 1);
			border-top:none;
			border-bottom:none;
			border-left:none;
			border-right:1px solid rgba(128, 128, 128, 1);
			font-weight:normal;
			font-style:normal;
			color:rgba(30, 255, 0, 1);
			text-align:left;
			flex-shrink:0;
			display:flex;
			position:relative;
			width:70px;
			height:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.user_touxiang{
			box-sizing:border-box;
			border:1px solid rgba(255, 255, 255, 1);
			border-top:1px solid rgba(255, 255, 255, 1);
			border-bottom:1px solid rgba(255, 255, 255, 1);
			border-left:1px solid rgba(255, 255, 255, 1);
			border-right:1px solid rgba(255, 255, 255, 1);
			border-radius:25px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:50px;
			height:50px;
			margin:10px 0px 0px 10px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.userDiscript{
			box-sizing:border-box;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			height:60px;
			width:100%;
			margin:10px 0px 0px 0px;
			flex-direction:column;
			justify-content:center;
			align-items:center;
		}
		.usersay{
			box-sizing:border-box;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:relative;
			width:100%;
			height:100%;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
		.type
		{
		    font-size: 30px; 
		    
			box-sizing:border-box;
			background-color:rgba(0, 0, 0, 0.8);
			border:2px solid rgba(255, 247, 0, 1);
			border-top:2px solid rgba(255, 247, 0, 1);
			border-bottom:2px solid rgba(255, 247, 0, 1);
			border-left:2px solid rgba(255, 247, 0, 1);
			border-right:2px solid rgba(255, 247, 0, 1);
			border-radius:0px 0px 10px 10px;
			font-weight:normal;
			font-style:normal;
			text-align:left;
			display:flex;
			position:sticky;
			top:nullpx;
			left:nullpx;
			right:nullpx;
			bottom:1px;
			height:200px;
			width:100%;
			padding:0px 0px 0px 0px;
			flex-direction:row;
			justify-content:flex-start;
			align-items:flex-start;
			flex-wrap:wrap;
		}
		.info
		{
		    padding: 1px;
		    color: lightblue;
            font-size: 30px; 
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
			width:100%;
			height:50px;
			margin:0px 0px 5px 0px;
			flex-direction:column;
			justify-content:flex-start;
			align-items:flex-start;
		}
	</style>
</body>
</html>
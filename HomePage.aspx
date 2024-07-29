<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Final.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我们是地火！</title>
</head>
<body>
	<div class="upLan">
		<div class="logo"><asp:Image ID="Image1" runat="server" Height="48px" 
                ImageUrl="~/Pictures/wildfireLOGO.png" Width="49px" /></div>
		<div class="says"> 地火论坛！</div>
		<div class="spaces">
			<div class="button1"><a href="login.aspx" style="color: red;">退出登录</a></div>
			<div class="button2"><a href="createSecert.aspx" style="color: red;">进入秘密论坛</a></div>
			<div class="button3"><%= Session["username"] %>，<br/>欢迎来到地火！</div>
		</div>

		<div class="user"><asp:Image ID="Image2" runat="server" Height="48px" 
                ImageUrl="~/Pictures/userLOGO.jpg" Width="49px" /></div>
	</div>
	<div class="mainpane">

		<div class="comment">
			<div class="speechPane">
                



            <form id="form_homepage" runat="server">
            
           
            <div class="big-button">最新的五条消息：</div>


          
                

            <asp:GridView ID="GridView_newmessage" runat="server"
            ShowHeader="False"  
            onrowcommand="GridView_newmessage_allFs_RowCommand"
             CssClass="gridview-style" AutoGenerateColumns="False">
                <Columns>
                    <asp:ButtonField Text="回复" CommandName="gotoTopic2" />
                    <asp:BoundField DataField="topicid" />
                    <asp:BoundField DataField="username" />
                    <asp:BoundField DataField="message" />
                </Columns>
                </asp:GridView>
                </br>
               <asp:Button ID="Button_create" runat="server" Text="创建话题" 
                onclick="Button_create_Click" CssClass="big-button" />    
                <div class="big-button">点击进入话题，畅聊</div>

                 <asp:GridView ID="GridView_homepage_allFs"  runat="server" 
              ShowHeader="False" 
              onrowcommand="GridView_homepage_allFs_RowCommand"
               CssClass="gridview-style" >
                 <Columns>
               <asp:ButtonField Text="进入话题" CommandName="gotoTopic" />
                 </Columns>
                    </asp:GridView>


                 </form>
            </div>
		</div>

	</div>
	<style>
	    
		html,body
		{
		    transform-origin: top left;
			padding:0;
			margin:0;
			width:100%;
			height:100%;
		}
		body
		{
		    transform-origin: top left;
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
		.gridview-style 
		{
		 word-break:break-all;
         word-wrap:break-word;
		 transform-origin: top left;
        font-size: 40px; 
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
		.mainpane
		{
		   transform-origin: top left;
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
		   transform-origin: top left;
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
		.speechPane
		{
		    transform-origin: top left;
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

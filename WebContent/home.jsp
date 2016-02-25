<%@page import="model.User,java.sql.ResultSet,model.UserDatabase"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Home Page</title>
<style type="text/css">
<
style type ="text /css">table {
	font-family: Comic Sans MS;
} /* added custom font-family  */
table.one {
	margin-bottom: 3em;
	border-collapse: collapse;
}

td { /* removed the border from the table data rows  */
	
}

th { /* removed the border from the table heading row  */
	padding: .5em;
	background-color: #999999;
	/* added a red background color to the heading cells  */
	font-family: Comic Sans MS;
	text-align: left;
	color: white;
} /* added a white font color to the heading text */
.CSSTableGenerator {
	width: 50%;
	box-shadow: 5px 5px 5px #888888;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.CSSTableGenerator table {
	border-collapse: collapse;
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
}

.CSSTableGenerator tr:hover td {
	background-color: #d9d9d9;
}

.CSSTableGenerator td {
	vertical-align: middle;
	background-color: #ffffff;
	border: 1px solid #000000;
	border-width: 0px 0px 0px 0px;
	text-align: left;
	padding: 5px;
	font-size: 10px;
	font-family: Comic Sans MS;
	font-weight: normal;
	color: #000000;
}

.CSSTableGenerator tr:first-child td {
	background: -o-linear-gradient(bottom, #113b66 5%, #0e4175 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #113b66
		), color-stop(1, #0e4175));
	background: -moz-linear-gradient(center top, #113b66 5%, #0e4175 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#113b66",
		endColorstr="#0e4175");
	background: -o-linear-gradient(top, #113b66, 0e4175);
	background-color: #113b66;
	border: 0px solid #000000;
	text-align: center;
	border-width: 0px 0px 1px 1px;
	font-size: 14px;
	font-family: Comic Sans MS;
	font-weight: bold;
	color: #ffffff;
}

.CSSTableGenerator tr:first-child:hover td {
	background: -o-linear-gradient(bottom, #113b66 5%, #0e4175 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #113b66
		), color-stop(1, #0e4175));
	background: -moz-linear-gradient(center top, #113b66 5%, #0e4175 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#113b66",
		endColorstr="#0e4175");
	background: -o-linear-gradient(top, #113b66, 0e4175);
	background-color: #113b66;
}

.titlebardivwrap {
	width: 100%;
	height: 50px;
	background-color: #e6e6ff;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 10px rgba(0, 0, 0, .31);
	border: solid 1px #cbc9c9;
}

.profiledivwrap {
	width: 100%;
	height: auto;
	background-color: #ebebeb;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
}

.uploaddivwrap {
	width: 100%;
	height: auto;
	background-color: #ebebeb;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	border: solid 1px #cbc9c9;
}

.tabledivwrap {
	width: 100%;
	height: auto;
	background-color: #ebebeb;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	border: solid 1px #cbc9c9;
}

.logoutdivwrap {
	width: 100%;
	height: auto;
	background-color: #ebebeb;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	border: solid 1px #cbc9c9;
}
</style>

</head>
<body>
	<%
		//allow access only if session exists
		User user = null;
		String sessionId = null;
		ResultSet resultSet = null;
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.html");
		} else {
			user = (User) session.getAttribute("user");

			resultSet = UserDatabase.displayUserData(user.getId());

			sessionId = session.getId();
		}
	%>
	<div class="titlebardivwrap" align="right">
		<h3>
			hi ,
			<%=user.getFirstName()%>..
		</h3>
	</div>
	<!--<div class="profiledivwrap">
		
		<br> Name=<%=user.getLastName() + " " + user.getFirstName()%>
		<br> Email=<%=user.getEmail()%>
		<br> Birthday=<%=user.getBirthDay()%>
		<br> Gender=<%=user.getGender()%>
		<br>
	</div> -->

	<div class="uploaddivwrap" align="center">
		<form action="FileUploadServlet" method="post"
			enctype="multipart/form-data">
			Select File to Upload:<input type="file" name="choosenFileName">
			<br> <input type="submit" value="Upload">
		</form>
	</div>
	<div class="tabledivwrap" align="center">
		<TABLE class="CSSTableGenerator">
			<TR>
				<TH>File Name</TH>
				<TH>Type</TH>
				<TH>Size</TH>
				<TH>Upload date</TH>
				<TH>Download</TH>
				<TH>Delete</TH>
			</TR>
			<%
				if (resultSet != null) {
					do {
			%>

			<TR>
				<TD><%=resultSet.getString("file_name")%></TD>
				<TD><%=resultSet.getString("file_type")%></TD>
				<TD><%=Float.parseFloat(resultSet.getString("file_size")) / 1048576%>
					mb</TD>
				<TD><%=resultSet.getString("created_on")%></TD>
				<TD><a
					href="FileDownloadServlet?file_id=<%=resultSet.getInt("file_id")%>&file_name=<%=resultSet.getString("file_name")%>">Download</a></TD>
				<TD><a
					href="FileDeleteServlet?file_id=<%=resultSet.getInt("file_id")%>">Delete</a></TD>
			</TR>

			<%
				} while (resultSet.next());
				}
			%>
		</TABLE>
	</div>
	<div align="center" class="logoutdivwrap">
		<form action="LogoutServlet" method="post">
			<input type="submit" value="Logout">
		</form>
	</div>


</body>
</html>
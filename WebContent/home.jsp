<%@page import="model.User,java.sql.ResultSet,model.UserDatabase"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Home Page</title>
<style type="text/css">
table {
	font-family: Comic Sans MS;
} /* added custom font-family  */
table.one {
	margin-bottom: 3em;
	border-collapse: collapse;
}

th { /* removed the border from the table heading row  */
	padding: .4em;
	font-weight: normal;
	font-family: Comic Sans MS;
	text-align: left;
	color: #1d2626;
} /* added a white font color to the heading text */
.CSSTableGenerator {
	width: 50%;
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
	text-align: left;
	padding: 5px;
	font-size: 13px;
	font-family: Comic Sans MS;
	font-weight: normal;
	color: #000000;
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
	background-color: #f1f5f5;
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

.viewdivwrap {
	margin: 100px auto;
	width: 590px;
	height: 400px;
	-webkit-border-radius: 8px/7px;
	-moz-border-radius: 8px/7px;
	border-radius: 8px/7px;
	background-color: #ebebeb;
	-webkit-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	-moz-box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	box-shadow: 1px 2px 5px rgba(0, 0, 0, .31);
	border: solid 1px #cbc9c9;
}
</style>
<script>
function myFunction( fileId,fileName) {
   var oImg=document.createElement("img");
	oImg.setAttribute('src', "FileDownloadServlet?file_id="+fileId+"&file_name="+fileName);
	oImg.setAttribute('alt', 'na');
	oImg.setAttribute('height', '400px');
	oImg.setAttribute('width', '590px');
	document.getElementById("viewimage").innerHTML = "";
	document.getElementById("viewimage").appendChild(oImg);
}
</script>
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

	<div class="tabledivwrap">
		<table style="width: 100%">
			<tr>
				<td style="width: 50%">

					<div style="display: inline-block;">
						<TABLE class="CSSTableGenerator" style="width: 100%">
							<TR>
								<TH>icon</TH>
								<TH>File Name</TH>
								<TH>Type</TH>
								<TH>Size</TH>
								<TH>Upload date</TH>
								<TH>Download</TH>
								<TH>Delete</TH>
								<TH>Open</TH>
							</TR>
							<%
								if (resultSet != null) {
									do {
							%>

							<TR style="height: 40px">
								<td><img src="images/image2.png"></td>
								<TD><%=resultSet.getString("file_name")%></TD>
								<TD><%=resultSet.getString("file_type")%></TD>
								<TD><%=Float.parseFloat(resultSet.getString("file_size")) / 1048576%>
									mb</TD>
								<TD><%=resultSet.getString("created_on")%></TD>
								<TD><a
									href="FileDownloadServlet?file_id=<%=resultSet.getInt("file_id")%>&file_name=<%=resultSet.getString("file_name")%>">Download</a></TD>
								<TD><a
									href="FileDeleteServlet?file_id=<%=resultSet.getInt("file_id")%>">Delete</a></TD>
								<TD><button
										onclick="myFunction(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">open</button></TD>
							</TR>

							<%
								} while (resultSet.next());
								}
							%>
						</TABLE>
					</div>
				</td>
				<td style="width: 50%; vertical-align: top">
					<div id="viewimage" display:inline-block">
						<!--  <img src="images/abstract-310vv.jpg"  alt="Smiley face" height="400" width="590">
						<audio controls>
  							<source src="horse.ogg" type="audio/ogg">
  							<source src="songs/Sleep Away.mp3" type="audio/mpeg">
 							 Your browser does not support the audio tag.
						</audio>  -->
					</div>
				</td>
			</tr>
		</table>
	</div>


	<div align="center" class="logoutdivwrap">
		<form action="LogoutServlet" method="post">
			<input type="submit" value="Logout">
		</form>
	</div>


</body>
</html>
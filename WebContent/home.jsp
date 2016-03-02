<%@page import="model.User,java.sql.ResultSet,model.UserDatabase"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Home Page</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="StyleHome.css">
<script type="text/javascript" src="HomeJs.js"></script>

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
								<TH></TH>
								<TH>File Name</TH>
								<TH>Type</TH>
								<TH>Size</TH>
								<TH>Upload date</TH>
								<TH></TH>
								<TH></TH>
								<TH></TH>
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
								<%
									System.out.println(resultSet.getString("file_type"));
								%>
								<%
									if (resultSet.getString("file_type").equals("image/jpeg")) {
								%>
								<TD><button
										onclick="OpenImage(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">open</button></TD>
								<TD><button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#myModal"
										onclick="OpenImageModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">Open</button></TD>
								<%
									}
								%>
								<%
									if (resultSet.getString("file_type").equals("audio/mp3")) {
								%>
								<TD><button
										onclick="OpenAudio(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">open</button></TD>
								<TD><button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#myModal"
										onclick="OpenAudioModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">Open</button></TD>
								<%
									}
								%>
								<%
									if (resultSet.getString("file_type").equals("video/mp4")) {
								%>
								<TD><button
										onclick="OpenVideo(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">open</button></TD>
								<TD><button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#myModal"
										onclick="OpenVideoModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">Open</button></TD>
								<%
									}
								%>
								<%
									if (resultSet.getString("file_type").equals("application/pdf")) {
								%>
								<TD><button
										onclick="OpenPdf(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">open</button></TD>
										<TD><button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#myModal"
										onclick="OpenPdfModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>')">Open</button></TD>
								<%
									}
								%>

								<%
									} while (resultSet.next());
									}
								%>
							
						</TABLE>
					</div>
				</td>
				<td style="width: 50%; vertical-align: top">
					<div id="viewimage"display:inline-block"></div>
				</td>
			</tr>
		</table>
	</div>


	<div align="center" class="logoutdivwrap">
		<form action="LogoutServlet" method="post">
			<input type="submit" value="Logout">
		</form>
	</div>

	<div class="container">


		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" onClick="clearModalHtml()" class="close"
							data-dismiss="modal">&times;</button>

					</div>
					<div id="modalcontent" class="modal-body"></div>

				</div>

			</div>
		</div>

	</div>


</body>
</html>
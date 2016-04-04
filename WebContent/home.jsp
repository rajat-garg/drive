<%@page import="model.*,java.sql.ResultSet"%>
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
<body >
	<%
		//allow access only if session exists
		User user = (User) session.getAttribute("user");
		//String sessionId = null;
		ResultSet resultSet = null;
		FileTypeHmap fileTypeHmap = null;

		if (user != null) {

			fileTypeHmap = (FileTypeHmap) session.getAttribute("fileTypeHmap");
			resultSet = UserDatabase.displayUserData(user.getId());
			//resultSet = (ResultSet)session.getAttribute("resultSet");
			//resultSet = (ResultSet)request.getAttribute("resultSet");
	%>
	<div class="divwrap" align="center">

		<div class="titlebardivwrap">

			<table style="width: 100%">
				<tr>
					<td style="width: 50%">
						<h1>
							&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/logo.png" alt="mydrive"
								height="55" width="80">myDrive
						</h1>
					</td>
					<td style="width: 50%; text-align: right; padding: 20px;">
						<h3>
							hi ,
							<%=user.getFirstName()%>..&nbsp;&nbsp;<img
								src="images/userprofile.png" alt="user">
						</h3>
					</td>
				</tr>


			</table>
		</div>
		<!--<div class="profiledivwrap">
		
		<br> Name=<%=user.getLastName() + " " + user.getFirstName()%>
		<br> Email=<%=user.getEmail()%>
		<br> Birthday=<%=user.getBirthDay()%>
		<br> Gender=<%=user.getGender()%>
		<br>
	</div> -->

		<div class="uploaddivwrap">
			<table style="width: 100%">
				<tr>
					<td style="width: 50%">
						<form action="FileUploadServlet" method="post"
							enctype="multipart/form-data">
							<button class="addfilesbtn" onclick="selectfile(event)">Add
								Files..</button>
							<input type="file" name="choosenFileName" id="choosebtn"
								onchange="myUpload()" style="display: none;"> <br>
							<button type="submit" id="uploadBtn" style="display: none;">Upload</button>
						</form>
					</td>
					<td style="width: 50%; text-align: right; padding: 20px;"></td>
				</tr>


			</table>

		</div>

		<div class="tabledivwrap">


			<div>
				<TABLE class="CSSTableGenerator" style="width: 100%">
					<thead>
						<TR>
							<TH width="4%"></TH>
							<TH width="54%">Name</TH>
							<!-- <TH>Type</TH>  -->
							<TH width="10%">Size</TH>
							<TH width="10%">Upload date</TH>
							<TH width="8%"></TH>
							<TH width="7%"></TH>
							<TH width="7%"></TH>
						</TR>
					</thead>


					<%
						if (resultSet != null) {
								do {
					%>
					<tbody>
						<TR style="height: 40px">
							<!--	<td><img src="images/<%=resultSet.getString("file_type").split("/")[0]%>.png"></td> -->

							

							<td><img src="images/<%=fileTypeHmap.getType(resultSet.getString("file_type"))%>.png"></td>
							







							<TD><%=resultSet.getString("file_name")%></TD>
							<!--<TD><%=resultSet.getString("file_type")%></TD> -->
							<TD><%=Math.round((Float.parseFloat(resultSet.getString("file_size")) / 1048576) * 100)
								/ 100.0d%>
								mb</TD>
							<TD><%=resultSet.getDate("created_on")%></TD>
							<TD><a
								href="FileDownloadServlet?file_id=<%=resultSet.getInt("file_id")%>&file_name=<%=resultSet.getString("file_name")%>&mime=<%=resultSet.getString("file_type")%>">Download</a></TD>
							<TD><a
								href="FileDeleteServlet?file_id=<%=resultSet.getInt("file_id")%>">Delete</a></TD>
							<%
								System.out.println(resultSet.getString("file_type"));
							%>

							<%
								if (resultSet.getString("file_type").equals("text/plain")) {
							%>

							<TD><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal"
									onclick="OpenFileModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>','<%=resultSet.getString("file_type")%>')">Open</button></TD>
							<%
								}
							%>

							<%
								if (resultSet.getString("file_type").equals("image/jpeg")) {
							%>

							<TD><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal"
									onclick="OpenImageModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>','<%=resultSet.getString("file_type")%>')">Open</button></TD>
							<%
								}
							%>
							<%
								if (resultSet.getString("file_type").equals("audio/mp3")) {
							%>

							<TD><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal"
									onclick="OpenAudioModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>','<%=resultSet.getString("file_type")%>')">Open</button></TD>
							<%
								}
							%>
							<%
								if (resultSet.getString("file_type").equals("video/mp4")) {
							%>

							<TD><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal"
									onclick="OpenVideoModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>','<%=resultSet.getString("file_type")%>')">Open</button></TD>
							<%
								}
							%>
							<%
								if (resultSet.getString("file_type").equals("application/pdf")) {
							%>

							<TD><button type="button" class="btn btn-primary btn-sm"
									data-toggle="modal" data-target="#myModal" 
									onclick="OpenPdfModal(<%=resultSet.getInt("file_id")%>,'<%=resultSet.getString("file_name")%>','<%=resultSet.getString("file_type")%>')">Open</button></TD>
							<%
								} else {
							%>
							<TD></TD>
							<%
								}
							%>
							<%
								} while (resultSet.next());
									}
							%>
						
					</tbody>
				</TABLE>
			</div>




		</div>




		<div align="center" class="logoutdivwrap">
			<form action="LogoutServlet" method="post">
				<button type="submit" class="logoutbtn">logout</button>
			</form>
		</div>

		<div class="container">


			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog"  data-keyboard="false" data-backdrop="static">
				<div class="modal-dialog modal-lg">

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

	</div>
	<%
		} else {
			response.sendRedirect("login.html");
			//sessionId = session.getId();
		}
	%>

</body>
</html>
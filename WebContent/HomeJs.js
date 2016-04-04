function OpenImage(fileId, fileName) {
	var oImg = document.createElement("img");
	oImg.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName);
	oImg.setAttribute('alt', 'na');
	oImg.setAttribute('height', '400px');
	oImg.setAttribute('width', '590px');
	document.getElementById("viewimage").innerHTML = "";
	document.getElementById("viewimage").appendChild(oImg);
}
function OpenAudio(fileId, fileName) {
	var oAudio = document.createElement("audio");
	oAudio.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName);
	oAudio.setAttribute('type', 'audio/mpeg');
	oAudio.setAttribute("controls", "controls");
	oAudio.autoplay = true;
	document.getElementById("viewimage").innerHTML = "";
	document.getElementById("viewimage").appendChild(oAudio);
}

function OpenVideo(fileId, fileName) {
	var oVideo = document.createElement("video");
	oVideo.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName);
	oVideo.setAttribute('type', 'video/mp4;codecs="avc1.42E01E, mp4a.40.2"');
	oVideo.setAttribute('width', '640');
	oVideo.setAttribute('height', '380');
	oVideo.setAttribute("controls", "controls");
	oVideo.autoplay = true;
	document.getElementById("viewimage").innerHTML = "";
	document.getElementById("viewimage").appendChild(oVideo);
}
function OpenPdf(fileId, fileName) {
	var oPdf = document.createElement("object");
	oPdf.setAttribute('data', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName);
	oPdf.setAttribute('type', 'application/pdf');
	oPdf.setAttribute('width', '100%');
	oPdf.setAttribute('height', '900');
	document.getElementById("viewimage").innerHTML = "";
	document.getElementById("viewimage").appendChild(oPdf);
}

function OpenImageModal(fileId, fileName, fileType) {
	var oImg = document.createElement("img");
	oImg.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName + "&mime=" + fileType);
	oImg.setAttribute('alt', 'na');
	oImg.style.width = "100%";
	document.getElementById("modalcontent").innerHTML = "";
	document.getElementById("modalcontent").appendChild(oImg);
}

function OpenAudioModal(fileId, fileName, fileType) {
	var oAudio = document.createElement("audio");
	oAudio.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName + "&mime=" + fileType);
	oAudio.setAttribute('type', 'audio/mpeg');
	oAudio.setAttribute("controls", "controls");
	oAudio.autoplay = true;
	oAudio.style.width = "100%";
	document.getElementById("modalcontent").innerHTML = "";
	document.getElementById("modalcontent").appendChild(oAudio);
}
function OpenVideoModal(fileId, fileName, fileType) {
	var oVideo = document.createElement("video");
	oVideo.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName + "&mime=" + fileType);
	oVideo.setAttribute('type', 'video/mp4;codecs="avc1.42E01E, mp4a.40.2"');

	oVideo.setAttribute("controls", "controls");
	oVideo.autoplay = true;
	oVideo.style.width = "100%";
	document.getElementById("modalcontent").innerHTML = "";
	document.getElementById("modalcontent").appendChild(oVideo);
}

function OpenPdfModal(fileId, fileName, fileType) {
	var oPdf = document.createElement("object");
	oPdf.setAttribute('data', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName + "&mime=" + fileType);
	oPdf.setAttribute('type', 'application/pdf');
	oPdf.setAttribute('width', '100%');
	oPdf.setAttribute('height', '600');
	document.getElementById("modalcontent").innerHTML = "";
	document.getElementById("modalcontent").appendChild(oPdf);
}

function OpenFileModal(fileId, fileName, fileType) {
	var oFile = document.createElement("IFRAME");
	oFile.setAttribute('src', "FileDownloadServlet?file_id=" + fileId
			+ "&file_name=" + fileName + "&mime=" + fileType);

	oFile.setAttribute('frameBorder', '0');
	oFile.setAttribute('width', '100%');
	oFile.setAttribute('height', '600');
	document.getElementById("modalcontent").innerHTML = "";
	document.getElementById("modalcontent").appendChild(oFile);
}

function clearModalHtml() {
	document.getElementById("modalcontent").innerHTML = "";
}

function myUpload() {
	document.getElementById("uploadBtn").click();

}
function selectfile(e) {
	e.preventDefault();
	document.getElementById("choosebtn").click();
}

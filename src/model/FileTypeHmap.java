package model;

import java.util.HashMap;

public class FileTypeHmap {
	private HashMap<String, String> hmap = new HashMap<String, String>();

	public FileTypeHmap() {
		// TODO Auto-generated constructor stub

		hmap.put("text/plain", "text");
		hmap.put("image/png", "image");
		hmap.put("image/jpeg", "image");
		hmap.put("image/tif", "image");
		hmap.put("image/gif", "image");
		hmap.put("audio/mp3", "audio");
		hmap.put("audio/wav", "audio");
		hmap.put("audio/ogg", "audio");
		hmap.put("audio/oga", "audio");
		hmap.put("audio/wma", "audio");
		hmap.put("video/x-ms-wmv", "video");
		hmap.put("video/3gp", "video");
		hmap.put("video/amv", "video");
		hmap.put("video/asf", "video");
		hmap.put("video/avi", "video");
		hmap.put("video/divx", "video");
		hmap.put("video/mp4", "video");
		hmap.put("video/mpg", "video");
		hmap.put("video/qt", "video");
		hmap.put("application/pdf", "pdf");
		hmap.put("application/javascript", "javascript");
	}

	public String getType(String fileType) {
		if (hmap.containsKey(fileType))
			return hmap.get(fileType);
		else
			return "defaultimage";
	}
}

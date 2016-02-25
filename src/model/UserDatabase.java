package model;

import java.io.InputStream;
import java.sql.*;

import javax.servlet.http.Part;

public class UserDatabase {

	static Connection con;

	public static void createConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// for inserting registering user details in database.........................................................
	public static boolean insertRecord(String FirstName, String LastName, String Email, String Birthday, String Gender,
			String Password) {
		boolean st = false;
		try {
			createConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into RegisteredUser(firstname, lastname,email,birthday,gender, password) values(?,?,?,?,?,?)");
			ps.setString(1, FirstName);
			ps.setString(2, LastName);
			ps.setString(3, Email);
			ps.setString(4, Birthday);
			ps.setString(5, Gender);
			ps.setString(6, Password);

			int rs = ps.executeUpdate();
			if (rs > 0)
				st = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return st;
	}
	// for inserting a file in database.........................................................
	public static int insertFileInToUserData(Part filePart, int Id, String fileName) {
		int rs = 0;
		InputStream inputStream = null;
		try {
			createConnection();

			PreparedStatement ps = con.prepareStatement(
					"insert into UserData(user_id,file_name,file_type,file_size,file) values(?,?,?,?,?)");
			ps.setInt(1, Id);
			ps.setString(2, fileName);
			ps.setString(3, filePart.getContentType());
			ps.setLong(4, filePart.getSize());
			inputStream = filePart.getInputStream();

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				ps.setBlob(5, inputStream);

			}

			rs = ps.executeUpdate();

			System.out.println("no of rows infacted  =  " + rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	// to check if user is registered while logging in.........................................................
	public static User checkUser(String email, String pass) {
		boolean st = false;
		try {
			createConnection();
			User user = new User();

			PreparedStatement ps = con.prepareStatement("select * from RegisteredUser where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();

			st = rs.next();
			if (st) {
				user.setId(rs.getInt("id"));
				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setBirthDay(rs.getString("birthday"));
				user.setGender(rs.getString("gender"));
				System.out.println("value returned from select query =  " + st + user.getId() + user.getFirstName()
						+ user.getLastName() + user.getEmail() + user.getBirthDay() + user.getGender());
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// for displaying files user have in database.........................................................
	public static ResultSet displayUserData(int userId) {
		boolean st = false;
		try {
			createConnection();

			PreparedStatement ps = con
					.prepareStatement("select file_id,file_name,file_type,file_size,created_on from UserData where user_id=?");
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			st = rs.next();
			if (st) {

				return rs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
// for downloading a file.........................................................
	public static InputStream fileDownload(int userId,int file_id) {
		boolean st = false;
		try {
			createConnection();

			PreparedStatement ps = con
					.prepareStatement("select file from UserData where user_id=? and file_id=?");
			ps.setInt(1, userId);
			ps.setInt(2, file_id);

			ResultSet rs = ps.executeQuery();

			st = rs.next();
			if (st) {
				Blob blob = rs.getBlob("file");
                InputStream inputStream = blob.getBinaryStream();
				return inputStream;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//.................. deleting file from database............................
	public static boolean fileDelete(int userId,int file_id) {
		boolean st = false;
		try {
			createConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from UserData where user_id=? and file_id=?");
			ps.setInt(1, userId);
			ps.setInt(2, file_id);

		int rs = ps.executeUpdate();

			if(rs>0)
				st=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return st;
	}

}

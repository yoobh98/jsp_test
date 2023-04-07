package dbphrd;

import java.sql.Connection;
import java.sql.DriverManager;



public class DBConnect {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe","qudgus","1234");
		return con;
	}
}

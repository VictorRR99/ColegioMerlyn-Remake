package br.com.pro.main.banco.de.dados;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BancoDeDados {

	public Connection obterConexao() throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:postgresql://localhost:5432/JogoDoOito";
		String user = "UserJogoDoOito";
		String password = "114L";
		return DriverManager.getConnection(url, user, password);
	}
	
}

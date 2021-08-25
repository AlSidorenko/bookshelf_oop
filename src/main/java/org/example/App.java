package org.example;

import java.sql.*;
import java.util.ResourceBundle;

/**
 * Created on 17.08.2021 17:53.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class App {

    public static void main(String[] args) throws SQLException {
        ResourceBundle resource = ResourceBundle.getBundle("database");
        String url = resource.getString("db.url");
        String user = resource.getString("db.user");
        String password = resource.getString("db.password");

        System.out.println("Assist".hashCode());

        System.out.println("Hello!");
        Connection connection = DriverManager.getConnection(url, user, password);

        /*Statement query = con.createStatement();
        ResultSet rs = query.executeQuery("SELECT * FROM event");
        while( rs.next()) {
            System.out.println(rs.getString("name"));}*/


        String query = "SELECT * FROM author";

        try(PreparedStatement ps = connection.prepareCall(query)) {

            System.out.println(connection.isClosed());
            ps.setString(1, "modEmail");
            ResultSet rs = ps.executeQuery();

            /*UserMapper userMapper = new UserMapper();
            userMapper.extractFromResultSet(rs);*/

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

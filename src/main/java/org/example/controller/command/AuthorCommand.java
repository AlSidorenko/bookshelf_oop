package org.example.controller.command;

import org.example.model.entity.Author;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Properties;

/**
 * Created on 16.08.2021 23:34.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class AuthorCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        List<Author> authorList = findByAllAuthors();
        request.setAttribute("AUTHORS_LIST", authorList);

        return "/WEB-INF/jsp/authors.jsp";
    }

    private List<Author> findByAllAuthors() {
        String url = "jdbc:mysql://localhost:3306/kpi_db.bookshelf_oop?serverTimezone=UTC";
        Properties prop = new Properties();
        prop.put("user", "admin");
        prop.put("password", "admin");
        prop.put("autoReconnect", "true");
        prop.put("characterEncoding", "UTF-8");
        prop.put("useUnicode", "true");

        List<Author> lst = new ArrayList<>();
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            Connection cn = DriverManager.getConnection(url, prop);
            Statement st = cn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM author");

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String country = rs.getString(3);
                String dates = rs.getString(4);
                String gender = rs.getString(5);
                //String photo = rs.getString(6);
                // TODO
                //Blob blob = rs.getBlob("image");

                Blob photo = rs.getBlob(6);

                InputStream inputStream = photo.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);


                inputStream.close();
                outputStream.close();

                String link = rs.getString(7);
                // close

                lst.add(
                        new Author(id, name, country, dates, gender, photo, link)
                );
            }
            if (lst.size() > 0) {
                System.out.println(lst);
            } else {
                System.out.println("Not found");
            }

            if (rs != null) { // был ли создан ResultSet
                rs.close();
            } else {
                System.err.println("ошибка во время чтения из БД");
            }

            if (st != null) { // для 2-го блока try
                st.close();
            } else {
                System.err.println("Statement не создан");
            }

            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    System.err.println("Connection close error: " + e);
                }
            }
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
        }
        return lst;
    }
}

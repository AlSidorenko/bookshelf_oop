package org.example.controller.command;

import org.example.model.entity.Author;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Properties;

/**
 * Created on 26.08.2021 12:30.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class AddAuthorCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name_author");
        String country = request.getParameter("country");
        String dates = request.getParameter("dates_life");
        String gender = request.getParameter("gender");
        String photo = request.getParameter("photo_author");
        String link = request.getParameter("link_biography");

        if (name == null || country.equals("") || dates == null
                || gender.equals("") || photo == null || link.equals("")) {
            return "/WEB-INF/jsp/add_author.jsp";
        }

        Author author = new Author(name, country, dates, gender, photo, link);
        create(author);

        return "redirect:/authors";
    }

    public void create(Author author) {
        Connection cn = null;
        PreparedStatement ps = null;

        String url = "jdbc:mysql://localhost:3306/kpi_db.bookshelf_oop?serverTimezone=UTC";
        Properties prop = new Properties();
        prop.put("user", "admin");
        prop.put("password", "admin");
        prop.put("autoReconnect", "true");
        prop.put("characterEncoding", "UTF-8");
        prop.put("useUnicode", "true");

        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            cn = DriverManager.getConnection(url, prop);

            ps = cn.prepareStatement(
                    "INSERT INTO author (name_author, country, dates_life, gender, photo_author, link_biography) VALUES (?, ?, ?, ?, ?, ?)"
            );

            //ResultSet rs = ps.executeQuery("INSERT INTO author (name_author, country, dates_life, gender, photo_author, link_biography) VALUES (?, ?, ?, ?, ?, ?)");
            setPrepareStatementsParameters(author, ps);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // clean up JDBC objects
            close(cn, ps, null);
        }
    }

    private void setPrepareStatementsParameters(Author author, PreparedStatement ps)
            throws SQLException {
        ps.setString(1, author.getNameAuthor());
        ps.setString(2, author.getCountry());
        ps.setString(3, author.getDatesOfLife());
        ps.setString(4, author.getGender());
        ps.setString(5, author.getPhotoAuthor());
        ps.setString(6, author.getLinkBiography());
    }

    public void close(Connection cn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (cn != null) {
                cn.close();   // doesn't really close it ... just puts back in connection pool
            }
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }
}

package org.example.model.dao;

import org.example.model.entity.Author;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created on 06.09.2021 14:00.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class JDBCAuthorDao {

    private final ResourceBundle resource = ResourceBundle.getBundle("database");
    private final String pathPhotoAuthor = resource.getString("db.author.pathPhotoAuthor");

    @Resource(name="jdbc/kpi_db.bookshelf_oop")
    private DataSource dataSource;

    public JDBCAuthorDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Author> findByAllAuthors() throws Exception {

        List<Author> authors = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = dataSource.getConnection();

            // create sql statement
            String sql = resource.getString("db.author.find");

            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process result set
            while (myRs.next()) {

                // retrieve data from result set row
                int id = myRs.getInt("id_author");
                String name = myRs.getString("name_author");
                String country = myRs.getString("country");
                String dates = myRs.getString("dates_life");
                String gender = myRs.getString("gender");
                String photo = myRs.getString("photo_author");
                String biography = myRs.getString("link_biography");

                // create new author object
                Author author = new Author(id, name, country, dates, gender, photo, biography);

                // add it to the list of authors
                authors.add(author);
            }

            return authors;
        }
        finally {
            // close JDBC objects
            close(myConn, myStmt, myRs);
        }
    }

    private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {
        try {
            if (myRs != null) {
                myRs.close();
            }

            if (myStmt != null) {
                myStmt.close();
            }

            if (myConn != null) {
                myConn.close();   // doesn't really close it ... just puts back in connection pool
            }
        }
        catch (Exception exc) {
            exc.printStackTrace();
        }
    }

    public void addAuthor(Author author) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = dataSource.getConnection();

            // create sql for insert
            String sql = resource.getString("db.author.addAuthor");

            myStmt = myConn.prepareStatement(sql);

            // set the param values for the author
            myStmt.setString(1, author.getNameAuthor());
            myStmt.setString(2, author.getCountry());
            myStmt.setString(3, author.getDatesOfLife());
            myStmt.setString(4, author.getGender());
            myStmt.setString(5, pathPhotoAuthor + author.getPhotoAuthor());
            myStmt.setString(6, author.getLinkBiography());

            // execute sql insert
            myStmt.execute();
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public Author getAuthor(String theAuthorId) throws Exception {

        Author author = null;

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int authorId;

        try {
            // convert author id to int
            authorId = Integer.parseInt(theAuthorId);

            // get connection to database
            myConn = dataSource.getConnection();

            // create sql to get selected author
            String sql = resource.getString("db.author.getAuthor");

            // create prepared statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setInt(1, authorId);

            // execute statement
            myRs = myStmt.executeQuery();

            // retrieve data from result set row
            if (myRs.next()) {
                String name = myRs.getString("name_author");
                String country = myRs.getString("country");
                String dates = myRs.getString("dates_life");
                String gender = myRs.getString("gender");
                String photo = pathPhotoAuthor + myRs.getString("photo_author");
                String link = myRs.getString("link_biography");

                // use the authorId during construction
                author = new Author(authorId, name, country, dates, gender, photo, link);
            }
            else {
                throw new Exception("Could not find student id: " + authorId);
            }

            return author;
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, myRs);
        }
    }

    public void updateAuthor(Author author) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = dataSource.getConnection();

            // create SQL update statement
            String sql = resource.getString("db.author.updateAuthor");

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setString(1, author.getNameAuthor());
            myStmt.setString(2, author.getCountry());
            myStmt.setString(3, author.getDatesOfLife());
            myStmt.setString(4, author.getGender());
            myStmt.setString(5, author.getPhotoAuthor());
            myStmt.setString(6, author.getLinkBiography());

            myStmt.setInt(7, author.getIdAuthor());

            // execute SQL statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public void deleteAuthor(String authorId) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // convert author id to int
            int id = Integer.parseInt(authorId);

            // get connection to database
            myConn = dataSource.getConnection();

            // create sql to delete author
            String sql = resource.getString("db.author.deleteAuthor");

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setInt(1, id);

            // execute sql statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC code
            close(myConn, myStmt, null);
        }
    }
}

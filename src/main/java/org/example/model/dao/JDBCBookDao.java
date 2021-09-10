package org.example.model.dao;

import org.example.model.entity.Book;

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
 * Created on 09.09.2021 10:50.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class JDBCBookDao {

    private final ResourceBundle resource = ResourceBundle.getBundle("database");
    private final String pathPhotoBook = resource.getString("db.book.pathPhotoBook");

    @Resource(name="jdbc/kpi_db.bookshelf_oop")
    private DataSource dataSource;

    public JDBCBookDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Book> findByAllBooks() throws Exception {

        List<Book> books = new ArrayList<>();

        Connection myConn = null;
        Statement myStmt = null;
        ResultSet myRs = null;

        try {
            // get a connection
            myConn = dataSource.getConnection();

            // create sql book
            String sql = resource.getString("db.book.find");

            myStmt = myConn.createStatement();

            // execute query
            myRs = myStmt.executeQuery(sql);

            // process result set
            while (myRs.next()) {

                // retrieve data from result set row
                int idBook = myRs.getInt("id_book");
                String nameBook = myRs.getString("name_book");
                String authorBook = myRs.getString("author_book");
                String genreBook = myRs.getString("genre_book");
                String linkBook = myRs.getString("link_book");
                String photoBook = myRs.getString("photo_book");
                String ratingBook = myRs.getString("rating_book");

                // create new book object
                Book book = new Book(idBook, nameBook, authorBook, genreBook, linkBook, photoBook, ratingBook);

                // add it to the list of books
                books.add(book);
            }
            return books;
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

    public void addBook(Book book) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = dataSource.getConnection();

            // create sql for insert
            String sql = resource.getString("db.book.addBook");

            myStmt = myConn.prepareStatement(sql);

            // set the param values for the book
            myStmt.setString(1, book.getNameBook());
            myStmt.setString(2, book.getAuthorBook());
            myStmt.setString(3, book.getGenreBook());
            myStmt.setString(4, book.getLinkBook());
            myStmt.setString(5, pathPhotoBook + book.getPhotoBook());
            myStmt.setString(6, book.getRatingBook());

            // execute sql insert
            myStmt.execute();
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public Book getBook(String theBookId) throws Exception {

        Book book = null;

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        int bookId;

        try {
            // convert book id to int
            bookId = Integer.parseInt(theBookId);

            // get connection to database
            myConn = dataSource.getConnection();

            // create sql to get selected book
            String sql = resource.getString("db.book.getBook");

            // create prepared statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setInt(1, bookId);

            // execute statement
            myRs = myStmt.executeQuery();

            // retrieve data from result set row
            if (myRs.next()) {
                String nameBook = myRs.getString("name_book");
                String authorBook = myRs.getString("author_book");
                String genreBook = myRs.getString("genre_book");
                String linkBook = myRs.getString("link_book");
                String photoBook = pathPhotoBook + myRs.getString("photo_book");
                String ratingBook = myRs.getString("rating_book");

                // use the authorId during construction
                book = new Book(bookId, nameBook, authorBook, genreBook, linkBook, photoBook, ratingBook);
            }
            else {
                throw new Exception("Could not find student id: " + bookId);
            }

            return book;
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, myRs);
        }
    }

    public void updateBook(Book book) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // get db connection
            myConn = dataSource.getConnection();

            // create SQL update statement
            String sql = resource.getString("db.book.updateBook");

            // prepare statement
            myStmt = myConn.prepareStatement(sql);

            // set params
            myStmt.setString(1, book.getNameBook());
            myStmt.setString(2, book.getAuthorBook());
            myStmt.setString(3, book.getGenreBook());
            myStmt.setString(4, book.getLinkBook());
            myStmt.setString(5, book.getPhotoBook());
            myStmt.setString(6, book.getRatingBook());

            myStmt.setInt(7, book.getIdBook());

            // execute SQL statement
            myStmt.execute();
        }
        finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public void deleteBook(String bookId) throws Exception {

        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            // convert book id to int
            int id = Integer.parseInt(bookId);

            // get connection to database
            myConn = dataSource.getConnection();

            // create sql to delete book
            String sql = resource.getString("db.book.deleteBook");

            // prepare book
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

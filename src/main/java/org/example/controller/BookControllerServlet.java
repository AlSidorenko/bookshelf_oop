package org.example.controller; /**
 * Created on 06.09.2021 19:37.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */

import org.example.model.dao.JDBCBookDao;
import org.example.model.entity.Book;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

@WebServlet(name = "/bookshelf/books", value = "/bookshelf/books")
public class BookControllerServlet extends HttpServlet {
    private JDBCBookDao JDBCBookDao;
    private final ResourceBundle resource = ResourceBundle.getBundle("database");
    private final String pathPhotoBook = resource.getString("db.book.pathPhotoBook");

    @Resource(name="jdbc/kpi_db.bookshelf_oop")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();

        // create our book db util ... and pass in the conn pool / datasource
        try {
            JDBCBookDao = new JDBCBookDao(dataSource);
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // read the "command" parameter
            String theCommand = request.getParameter("command");

            // if the command is missing, then default to listing students
            if (theCommand == null) {
                theCommand = "BOOKS_LIST";
            }

            // route to the appropriate method
            switch (theCommand) {

                case "BOOKS_LIST":
                    listBooks(request, response);
                    break;

                case "ADD_BOOK":
                    addBook(request, response);
                    break;

                case "LOAD_BOOK":
                    loadBook(request, response);
                    break;

                case "UPDATE_BOOK":
                    updateBook(request, response);
                    break;

                case "DELETE_BOOK":
                    deleteBook(request, response);
                    break;

                default:
                    listBooks(request, response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read book id from form data
        String bookId = request.getParameter("id_book");

        // delete book from database
        JDBCBookDao.deleteBook(bookId);

        // send them back to "list books" page
        listBooks(request, response);
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read Book info from form data
        int id = Integer.parseInt(request.getParameter("id_book"));
        String nameBook = request.getParameter("name_book");
        String authorBook = request.getParameter("author_book");
        String genreBook = request.getParameter("genre_book");
        String linkBook = request.getParameter("link_book");
        String photoBook = pathPhotoBook + request.getParameter("photo_book");
        String ratingBook = request.getParameter("rating_book");

        // create a new Book object
        Book book = new Book(id, nameBook, authorBook, genreBook, linkBook, photoBook, ratingBook);

        // perform update on database
        JDBCBookDao.updateBook(book);

        // send them back to the "list books" page
        listBooks(request, response);

    }

    private void loadBook(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read book id from form data
        String bookId = request.getParameter("id_book");

        // get book from database (db util)
        Book book = JDBCBookDao.getBook(bookId);

        // place book in the request attribute
        // update_book.jsp
        request.setAttribute("THE_BOOK", book);

        // send to jsp page: update_book.jsp
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/jsp/book/update_book.jsp");
        dispatcher.forward(request, response);
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read book info from form data
        String nameBook = request.getParameter("name_book");
        String authorBook = request.getParameter("author_book");
        String genreBook = request.getParameter("genre_book");
        String linkBook = request.getParameter("link_book");
        String photoBook = request.getParameter("photo_book");
        String ratingBook = request.getParameter("rating_book");

        // create a new book object
        Book book = new Book(nameBook, authorBook, genreBook, linkBook, photoBook, ratingBook);

        // add the book to the database
        JDBCBookDao.addBook(book);

        // send back to main page (the book list)
        listBooks(request, response);
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // get book from db util
        List<Book> books = JDBCBookDao.findByAllBooks();

        // add book to the request
        request.setAttribute("BOOKS_LIST", books);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/book/books.jsp");
        dispatcher.forward(request, response);
    }
}

package org.example.controller; /**
 * Created on 06.09.2021 19:36.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */

import org.example.model.dao.JDBCAuthorDao;
import org.example.model.entity.Author;

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

@WebServlet("/bookshelf/authors")
public class AuthorControllerServlet extends HttpServlet {

    private JDBCAuthorDao JDBCAuthorDao;

    @Resource(name="jdbc/kpi_db.bookshelf_oop")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();

        // create our student db util ... and pass in the conn pool / datasource
        try {
            JDBCAuthorDao = new JDBCAuthorDao(dataSource);
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
                theCommand = "AUTHORS_LIST";
            }

            // route to the appropriate method
            switch (theCommand) {

                case "AUTHORS_LIST":
                    listAuthors(request, response);
                    break;

                case "ADD_AUTHOR":
                    addAuthor(request, response);
                    break;

                case "LOAD_AUTHOR":
                    loadAuthor(request, response);
                    break;

                case "UPDATE_AUTHOR":
                    updateAuthor(request, response);
                    break;

                case "DELETE_AUTHOR":
                    deleteAuthors(request, response);
                    break;

                default:
                    listAuthors(request, response);
            }
        }
        catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void deleteAuthors(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read Author id from form data
        String authorId = request.getParameter("id_author");

        // delete student from database
        JDBCAuthorDao.deleteAuthor(authorId);

        // send them back to "list authors" page
        listAuthors(request, response);
    }

    private void updateAuthor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read Author info from form data
        int id = Integer.parseInt(request.getParameter("id_author"));
        String name = request.getParameter("name_author");
        String country = request.getParameter("country");
        String dates = request.getParameter("dates_life");
        String gender = request.getParameter("gender");
        String photo = request.getParameter("photo_author");
        String link = request.getParameter("link_biography");

        // create a new Author object
        String linkPhoto = "/media/" + photo;
        Author author = new Author(id, name, country, dates, gender, linkPhoto, link);

        // perform update on database
        JDBCAuthorDao.updateAuthor(author);

        // send them back to the "list students" page
        listAuthors(request, response);

    }

    private void loadAuthor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read author id from form data
        String authorId = request.getParameter("id_author");

        // get author from database (db util)
        Author author = JDBCAuthorDao.getAuthor(authorId);

        // place author in the request attribute
        request.setAttribute("THE_AUTHOR", author);

        // send to jsp page: update_author.jsp
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/jsp/author/update_author.jsp");
        dispatcher.forward(request, response);
    }

    private void addAuthor(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // read Author info from form data
        String name = request.getParameter("name_author");
        String country = request.getParameter("country");
        String dates = request.getParameter("dates_life");
        String gender = request.getParameter("gender");
        String photo = request.getParameter("photo_author");
        String link = request.getParameter("link_biography");

        // create a new author object
        Author author = new Author(name, country, dates, gender, photo, link);

        // add the author to the database
        JDBCAuthorDao.addAuthor(author);

        // send back to main page (the student list)
        listAuthors(request, response);
    }

    private void listAuthors(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        // get author from db util
        List<Author> authors = JDBCAuthorDao.findByAllAuthors();

        // add author to the request
        request.setAttribute("AUTHORS_LIST", authors);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/author/authors.jsp");
        dispatcher.forward(request, response);
    }
}

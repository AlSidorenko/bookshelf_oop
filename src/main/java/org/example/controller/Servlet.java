package org.example.controller;

import org.example.controller.command.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created on 16.08.2021 22:44.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class Servlet extends HttpServlet {

    private Map<String, Command> commands = new HashMap<>();

    @Override
    public void init(ServletConfig servletConfig) {
        commands.put("main", new MainCommand());
        commands.put("books", new BookCommand());
        commands.put("authors", new AuthorCommand());
        commands.put("add_authors", new AddAuthorCommand());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();
        System.out.println(path);
        path = path.replaceAll(".*/bookshelf/","");
        System.out.println(path);
        Command command = commands.getOrDefault(path, (req, resp) -> "/index.jsp");
        String page = command.execute(request, response);

        if (page.contains("redirect")) {
            response.sendRedirect(page.replace("redirect:", "/bookshelf"));
        } else {
            request.getRequestDispatcher(page).forward(request, response);
        }
    }
}
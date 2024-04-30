package jee.javapack.filter;

import jee.javapack.beans.Film;
import jee.javapack.dao.FilmDAOImpl;
import jee.javapack.dao.LoginDAO;
import jee.javapack.dao.UserrDAO;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebFilter(filterName = "ServletFilter")
public class ServletFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException, IOException {
        HttpSession session = ((HttpServletRequest) request).getSession();
        String login = request.getParameter("login");
        String password = request.getParameter("pwd");
        UserrDAO user = LoginDAO.authenticate(login, password);
        System.out.println("Login Attempt: Email - " + login + ", Password - " + password);
        if (user != null) {
            session.setAttribute("login", login);
            String role = user.getRole();
            if ("admin".equals(role)) {
                session.setAttribute("role", user.getRole());
                chain.doFilter(request, response);
            } else {
                session.setAttribute("role", "user");
                session.setAttribute("id", user.getId());
                session.setAttribute("name", login);
                chain.doFilter(request, response);
            }
        } else {
            session.setAttribute("role", "notfound");
            chain.doFilter(request, response);
        }

    }
}

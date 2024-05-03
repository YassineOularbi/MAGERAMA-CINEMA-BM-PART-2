package jee.javapack.filter;

import jee.javapack.dao.UserDAOImpl;
import jee.javapack.dto.UserDTO;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

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
        UserDAOImpl userDAO = new UserDAOImpl();
        UserDTO user = null;
        try {
            user = userDAO.authenticate(login, password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        if (user != null) {
            session.setAttribute("login", login);
            String role = user.getRoleAU();
            if ("admin".equals(role)) {
                session.setAttribute("role", user.getRoleAU());
                chain.doFilter(request, response);
            } else {
                session.setAttribute("role", "user");
                session.setAttribute("id", user.getId());
                session.setAttribute("name", user.getUserName());
                chain.doFilter(request, response);
            }
        } else {
            session.setAttribute("role", "notfound");
            chain.doFilter(request, response);
        }

    }
}

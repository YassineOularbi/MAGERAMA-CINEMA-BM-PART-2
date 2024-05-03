package jee.javapack.servlets;

import db.hibernate.dao.HibernateDAO;
import db.hibernate.dao.HibernateDAOImpl;
import jee.javapack.beans.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/signUp")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HibernateDAO hibernateDAO = new HibernateDAOImpl();
        String userName = request.getParameter("name");
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");
        User user = new User();
        user.setUserName(userName);
        user.setUserMail(userEmail);
        user.setPassword(userPassword);
        try {
            hibernateDAO.save(user);
        } catch (InstantiationException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        this.getServletContext().getRequestDispatcher("/authentication.jsp").forward(request, response);
    }
}

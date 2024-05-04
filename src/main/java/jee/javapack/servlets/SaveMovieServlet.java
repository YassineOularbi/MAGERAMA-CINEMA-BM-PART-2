package jee.javapack.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jee.javapack.dao.ConnectionDAO;

@WebServlet("/SaveMovieServlet")
public class SaveMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get movie ID from request
        String movieIdParam = request.getParameter("movieId");

        // Check if movieIdParam is not empty
        if (movieIdParam == null || movieIdParam.isEmpty()) {
            out.println("{\"message\": \"Movie ID is empty or missing!\"}");
            return;
        }

        // Parse movie ID
        int movieId;
        try {
            movieId = Integer.parseInt(movieIdParam);
        } catch (NumberFormatException e) {
            out.println("{\"message\": \"Invalid movie ID format!\"}");
            return;
        }

        // Get user ID from session
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");

        try {
            // Get connection
            Connection connection = ConnectionDAO.getConnection();

            // Prepare statement to insert into Playlist table
            PreparedStatement pstmt = connection.prepareStatement("INSERT INTO Playlist (userId, filmId) VALUES (?, ?)");
            pstmt.setInt(1, userId);
            pstmt.setInt(2, movieId);

            // Execute the statement
            int rowsInserted = pstmt.executeUpdate();

            // Close statement and connection
            pstmt.close();
            connection.close();

            // Send response
            if (rowsInserted > 0) {
                out.println("{\"message\": \"Added successfully to your playlist!\"}");
            } else {
                out.println("{\"message\": \"Failed to add to your playlist!\"}");
            }
        } catch (SQLException e) {
            out.println("{\"message\": \"Error: " + e.getMessage() + "\"}");
        }
    }

}















package jee.javapack.servlets;

import jee.javapack.beans.Comment;
import jee.javapack.dao.CommentDAO;
import jee.javapack.dao.CommentDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {
    private final CommentDAO commentDAO = new CommentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implémentez la logique pour gérer les requêtes GET ici
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données de la requête
        Long userId = Long.parseLong(request.getParameter("userId"));
        Long filmId = Long.parseLong(request.getParameter("filmId"));
        String commentText = request.getParameter("commentText");

        // Créer un objet Comment avec les données reçues
        Comment comment = new Comment();
        comment.setUserId(userId);
        comment.setFilmId(filmId);
        comment.setCommentText(commentText);

        // Ajouter le commentaire à la base de données
        try {
            commentDAO.addComment(comment);

            // Envoyer une réponse au client
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Merci pour votre commentaire !</h2>");
            out.println("</body></html>");
        } catch (Exception e) {
            // Gérer l'exception (par exemple, afficher un message d'erreur)
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Une erreur s'est produite lors de l'ajout du commentaire.");
        }
    }
}

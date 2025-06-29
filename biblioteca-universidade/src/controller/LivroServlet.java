package controller;

import model.Livro;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/LivroServlet")
public class LivroServlet extends HttpServlet {

    private static final List<Livro> livros = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("ano");
        String isbn = request.getParameter("isbn");

        if (titulo.isEmpty() || autor.isEmpty() || anoStr.isEmpty() || isbn.isEmpty()) {
            request.setAttribute("erro", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);
            return;
        }

        try {
            int ano = Integer.parseInt(anoStr);
            Livro livro = new Livro(titulo, autor, ano, isbn);
            livros.add(livro);
            response.sendRedirect("view/listar.jsp");
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Ano inválido.");
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("excluir".equals(acao)) {
            String isbn = request.getParameter("isbn");
            livros.removeIf(livro -> livro.getIsbn().equals(isbn));
            response.sendRedirect("view/listar.jsp");
        }
    }

    public static List<Livro> getLivros() {
        return livros;
    }
}

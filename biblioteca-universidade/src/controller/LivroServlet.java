package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import model.Livro;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

@WebServlet("/LivroServlet")
public class LivroServlet extends HttpServlet {
    public static List<Livro> livros = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // aqui vai seu código do doPost, tudo dentro da classe!
        String acao = request.getParameter("acao");
        if ("excluir".equals(acao)) {
            String isbn = request.getParameter("isbn");
            if (isbn != null) {
                Iterator<Livro> it = livros.iterator();
                while (it.hasNext()) {
                    Livro l = it.next();
                    if (l.getIsbn().equals(isbn)) {
                        it.remove();
                        break;
                    }
                }
            }
            response.sendRedirect("view/listar.xhtml");
            return;
        }

        // restante do código do cadastro
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
            livros.add(new Livro(titulo, autor, ano, isbn));
            response.sendRedirect("view/listar.xhtml");
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Ano inválido.");
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);
        }
    }
}

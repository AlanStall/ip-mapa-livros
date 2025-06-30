package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import model.Livro;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

// classe para as funcionalidades de cadastrar e excluir livro pelo JSP (.jsp)
@WebServlet("/LivroServlet")
public class LivroServlet extends HttpServlet {
    public static List<Livro> livros = new ArrayList<>();

    // metodo servlet para criar novo livro e também excluir o livro
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Se ação for de excluir vinda lá do jsp excluir.jsp, esclui o livro
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
            // Após excluir livro, direciona o usuário para tela de livros cadastrados
            response.sendRedirect("view/listar.xhtml");
            return;
        }

        // atributos para o cadastro
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoStr = request.getParameter("ano");
        String isbn = request.getParameter("isbn");

        // validação para que campos contenham obrigatoriamente informações
        if (titulo.isEmpty() || autor.isEmpty() || anoStr.isEmpty() || isbn.isEmpty()) {
            request.setAttribute("erro", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);
            return;
        }

        // Validação para que o ISBN contém apenas números
        if (!isbn.matches("\\d+")) {
            request.setAttribute("erro", "O ISBN deve conter apenas números.");
            request.getRequestDispatcher("view/cadastro.jsp").forward(request, response);
            return;
        }

        // Converte ano para inteiro e cadastra o livro.
        // Se valor do ano não número exibe mensagem de erro.
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

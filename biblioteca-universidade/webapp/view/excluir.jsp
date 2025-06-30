<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@ page
import="controller.LivroServlet" %> <%@ page import="model.Livro" %> <% String
isbn = request.getParameter("isbn"); Livro livroParaExcluir = null; for (Livro l
: LivroServlet.livros) { if (l.getIsbn().equals(isbn)) { livroParaExcluir = l;
break; } } %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Excluir Livro</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 40px;
        color: #333;
      }

      .container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        max-width: 600px;
        margin: auto;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      }

      h2 {
        color: #6a0dad;
      }

      p {
        margin: 10px 0;
        font-size: 16px;
      }

      .buttons {
        margin-top: 20px;
      }

      .buttons input[type="submit"],
      .buttons a {
        padding: 10px 20px;
        font-size: 15px;
        text-decoration: none;
        border: none;
        border-radius: 5px;
        margin-right: 10px;
        cursor: pointer;
      }

      .buttons input[type="submit"] {
        background-color: #6a0dad;
        color: white;
      }

      .buttons a {
        background-color: #bdc3c7;
        color: #2c3e50;
      }

      .buttons a:hover {
        background-color: #95a5a6;
      }

      .buttons input[type="submit"]:hover {
        background-color: #6a0dad;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Confirmar exclusão do livro</h2>

      <% if (livroParaExcluir != null) { %>
      <p><strong>Título:</strong> <%= livroParaExcluir.getTitulo() %></p>
      <p><strong>Autor:</strong> <%= livroParaExcluir.getAutor() %></p>
      <p><strong>Ano:</strong> <%= livroParaExcluir.getAno() %></p>
      <p><strong>ISBN:</strong> <%= livroParaExcluir.getIsbn() %></p>

      <form action="../LivroServlet" method="post" class="buttons">
        <input type="hidden" name="acao" value="excluir" />
        <input type="hidden" name="isbn" value="<%= isbn %>" />
        <input type="submit" value="Confirmar Exclusão" />
        <a href="listar.xhtml">Cancelar</a>
      </form>
      <% } else { %>
      <p>Livro não encontrado!</p>
      <div class="buttons">
        <a href="listar.xhtml">Voltar para a lista</a>
      </div>
      <% } %>
    </div>
  </body>
</html>

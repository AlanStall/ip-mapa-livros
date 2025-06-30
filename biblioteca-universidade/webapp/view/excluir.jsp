<%@ page import="controller.LivroServlet" %> <%@ page import="model.Livro" %> <%
String isbn = request.getParameter("isbn"); Livro livroParaExcluir = null; for
(Livro l : LivroServlet.livros) { if (l.getIsbn().equals(isbn)) {
livroParaExcluir = l; break; } } %>
<html>
  <head>
    <title>Excluir Livro</title>
    <style>
      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        padding: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 90vh;
      }
      .box {
        background-color: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        text-align: center;
      }
      .box p {
        font-size: 1.1rem;
        margin-bottom: 24px;
      }
      .btn {
        background-color: #6a0dad;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 1rem;
        border-radius: 6px;
        margin: 0 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }
      .btn:hover {
        background-color: #4b0082;
      }
      .btn-cancelar {
        background-color: #999;
      }
      .btn-cancelar:hover {
        background-color: #777;
      }
    </style>
  </head>
  <body>
    <h2>Confirmar exclusão do livro</h2>
    <% if (livroParaExcluir != null) { %>
    <p>Título: <%= livroParaExcluir.getTitulo() %></p>
    <p>Autor: <%= livroParaExcluir.getAutor() %></p>
    <p>Ano: <%= livroParaExcluir.getAno() %></p>
    <p>ISBN: <%= livroParaExcluir.getIsbn() %></p>

    <form action="../LivroServlet" method="post">
      <input type="hidden" name="acao" value="excluir" />
      <input type="hidden" name="isbn" value="<%= isbn %>" />
      <input type="submit" value="Confirmar Exclusão" />
      <a href="listar.xhtml">Cancelar</a>
    </form>
    <% } else { %>
    <p>Livro não encontrado!</p>
    <a href="listar.xhtml">Voltar para a lista</a>
    <% } %>
  </body>
</html>

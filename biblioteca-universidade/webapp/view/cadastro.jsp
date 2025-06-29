<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Cadastro de Livro</title>
  </head>
  <body>
    <h2>Cadastro de Livro</h2>
    <form action="../LivroServlet" method="post">
      Título: <input type="text" name="titulo" /><br />
      Autor: <input type="text" name="autor" /><br />
      Ano: <input type="text" name="ano" /><br />
      ISBN: <input type="text" name="isbn" /><br />
      <input type="submit" value="Cadastrar" />
    </form>

    <% if (request.getAttribute("erro") != null) { %>
    <p style="color: red"><%= request.getAttribute("erro") %></p>
    <% } %>

    <p><a href="listar.jsp">Ver livros cadastrados</a></p>
  </body>
</html>

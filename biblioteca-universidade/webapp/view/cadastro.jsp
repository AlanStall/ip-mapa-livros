<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>Cadastro de Livro</title>
    <style>
      body {
        font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
          sans-serif;
        padding: 1rem;
      }
      h2 {
        margin-bottom: 1rem;
      }
      form {
        row-gap: 16px;
      }
      .cadastro-info {
        display: flex;
        flex-direction: column;
        font-size: 0.875rem;
        margin-bottom: 12px;
      }
      .cadastro-info label {
        margin-bottom: 8px;
      }
      .cadastro-info input {
        border: 1px solid blueviolet;
        padding: 8px;
        border-radius: 8px;
      }
      input[type="submit"] {
        margin-top: 12px;
        padding: 4px 12px;
      }
      .cadastrar {
        background-color: #6a0dad;
        color: white;
        padding: 16px;
        border: none;
        border-radius: 6px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
        height: 40px;
      }
      .erro {
        color: red;
        margin-top: 12px;
      }
      a {
        text-decoration: none;
        font-weight: 600;
        transition: color 0.3s ease;
      }
      a:hover {
        text-decoration: underline;
      }
      p a {
        display: inline-block;
        background-color: #19ddda;
        color: white;
        padding: 10px 18px;
        border-radius: 6px;
        margin-top: 10px;
        text-decoration: none;
        transition: background-color 0.3s ease;
      }
      p a:hover {
        background-color: #19ddda;
      }
    </style>
  </head>
  <body>
    <h2>Cadastro de Livro</h2>

    <form action="../LivroServlet" method="post">
      <div class="cadastro-info">
        <label>Título:</label>
        <input type="text" name="titulo" />
      </div>
      <div class="cadastro-info">
        <label>Autor:</label>
        <input type="text" name="autor" />
      </div>
      <div class="cadastro-info">
        <label>Ano:</label>
        <input type="text" name="ano" />
      </div>
      <div class="cadastro-info">
        <label>ISBN:</label>
        <input type="text" name="isbn" />
      </div>

      <input type="submit" value="Cadastrar" class="cadastrar" />
    </form>

    <% if (request.getAttribute("erro") != null) { %>
    <p class="erro">Erro: <%= request.getAttribute("erro") %></p>
    <% } %>

    <p><a href="listar.jsp">Ver lista</a></p>
  </body>
</html>

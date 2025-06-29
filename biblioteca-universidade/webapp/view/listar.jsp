<%@ page import="controller.LivroServlet" %>
<%@ page import="model.Livro" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Livros Cadastrados</title></head>
<body>
<h2>Lista de Livros</h2>
<table border="1">
<tr>
    <th>Título</th><th>Autor</th><th>Ano</th><th>ISBN</th><th>Ação</th>
</tr>
<%
    List<Livro> livros = LivroServlet.getLivros();
    for (Livro livro : livros) {
%>
<tr>
    <td><%= livro.getTitulo() %></td>
    <td><%= livro.getAutor() %></td>
    <td><%= livro.getAno() %></td>
    <td><%= livro.getIsbn() %></td>
    <td><a href="../LivroServlet?acao=excluir&isbn=<%= livro.getIsbn() %>">Excluir</a></td>
</tr>
<% } %>
</table>
<p><a href="cadastro.jsp">Cadastrar novo livro</a></p>
</body>
</html>

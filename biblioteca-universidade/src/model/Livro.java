package model;

public class Livro {
    // atributos seguindo boas práticas protegidos com o modificador de acesso private
    private String titulo;
    private String autor;
    private int ano;
    private String isbn;

    // construtor da classe
    public Livro() {}

    // classe seguindo a lista de atributos requisitados em requisitos funcionais
    public Livro(String titulo, String autor, int ano, String isbn) {
        this.titulo = titulo;
        this.autor = autor;
        this.ano = ano;
        this.isbn = isbn;
    }

    // métodos getters e setters para os atributos, seguindo boas práticas e serem públicos
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }

    public int getAno() { return ano; }
    public void setAno(int ano) { this.ano = ano; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }
}


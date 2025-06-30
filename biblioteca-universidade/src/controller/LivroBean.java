package controller;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import model.Livro;
import java.io.Serializable;
import java.util.List;

@ManagedBean(name = "livroBean")
@SessionScoped
public class LivroBean implements Serializable {
    public List<model.Livro> getLivros() {
        return controller.LivroServlet.livros;
    }

}

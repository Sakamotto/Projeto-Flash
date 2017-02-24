import model.dominio.Curso;
import model.dominio.Disciplina;
import model.dominio.Horario;
import model.dominio.Professor;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

import javax.xml.validation.Schema;

/**
 * Created by danilo on 23/02/17.
 */
public class GenerateDataBase {

    public static void main(String[] args) {
        AnnotationConfiguration config = new AnnotationConfiguration();

        config.addAnnotatedClass(Curso.class);
        config.addAnnotatedClass(Disciplina.class);
        config.addAnnotatedClass(Horario.class);
        config.addAnnotatedClass(Professor.class);

        config.configure("hibernate.cfg.xml");

        new SchemaExport(config).create(true, true);

    }
}

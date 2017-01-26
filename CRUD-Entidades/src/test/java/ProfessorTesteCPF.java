import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;
import cucumber.api.junit.Cucumber;


@RunWith(Cucumber.class)
@CucumberOptions(glue = "teste.passos", monochrome=true)
public class ProfessorTesteCPF {
}

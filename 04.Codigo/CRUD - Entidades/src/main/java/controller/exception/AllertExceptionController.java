package controller.exception;

import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;

/**
 * Created by danilo on 24/10/16.
 */
public class AllertExceptionController {

    public static void noItemSelected(String msg) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setContentText(msg);
        alert.show();
    }

    public static boolean confirmation(String msg) {
        Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
        alert.setContentText(msg);
        alert.showAndWait();

        return alert.getResult() == ButtonType.OK;
    }
}

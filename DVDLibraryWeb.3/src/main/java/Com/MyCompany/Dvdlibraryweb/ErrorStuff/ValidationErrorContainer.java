package Com.MyCompany.Dvdlibraryweb.ErrorStuff;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by David Kolesar
 */
public class ValidationErrorContainer {

    private List<ValidationError> errorList = new ArrayList();

    public List<ValidationError> getErrorList() {
        return errorList;
    }

    public void addError(ValidationError error) {
        errorList.add(error);
    }
}

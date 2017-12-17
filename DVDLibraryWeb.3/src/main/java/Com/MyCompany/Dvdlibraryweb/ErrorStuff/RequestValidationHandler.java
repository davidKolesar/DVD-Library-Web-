package Com.MyCompany.Dvdlibraryweb.ErrorStuff;

import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Created by David Kolesar
 */
@ControllerAdvice
public class RequestValidationHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public ValidationErrorContainer processValidationErrors(MethodArgumentNotValidException ex) {

        BindingResult result = ex.getBindingResult();

        List<FieldError> fieldErrorList = result.getFieldErrors();

        ValidationErrorContainer container = new ValidationErrorContainer();

        for (FieldError error : fieldErrorList) {

            ValidationError vError = new ValidationError();

            vError.setFieldName(error.getField());
            vError.setMessage(error.getDefaultMessage());

            container.addError(vError);

        }

        return container;

    }

}

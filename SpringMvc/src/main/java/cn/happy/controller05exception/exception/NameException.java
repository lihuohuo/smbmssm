package cn.happy.controller05exception.exception;

/**
 * Created by Happy on 2017-08-28.
 */
public class NameException extends UserException {
    public NameException() {
    }

    public NameException(String message) {
        super(message);
    }
}

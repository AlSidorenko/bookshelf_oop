package org.example.model.service;

/**
 * Created on 31.08.2021 18:58.
 *
 * @author Aleks Sidorenko (e-mail: alek.sidorenko@gmail.com).
 * @version Id$.
 * @since 0.1.
 */
public class DataValidator {

    public static boolean isNotNull(String val) {
        return !isNull(val);
    }

    public static boolean isNull(String val) {
        if (val == null || val.trim().length() == 0) {
            return true;
        } else {
            return false;
        }
    }
}

package model.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regex {
    private static final String PHONE_NUMBER_REGEX = "^(0|(\\(84\\)\\+))+([9][0-1][0-9]{7})$";
    private static final String ID_CARD_NUMBER_REGEX = "^([0-9]{9})|([0-9]{12})$";
    private static final String EMAIL_REGEX = "^(?:^|\\s)[\\w!#$%&'*+/=?^`{|}~-](\\.?[\\w!#$%&'*+/=?^`{|}~-]+)*@\\w+[.-]?\\w*\\.[a-zA-Z]{2,3}\\b$";
    private static final String BIRTHDAY_REGEX = "^(?:0[1-9]|[12][0-9]|3[01])[-/.](?:0[1-9]|1[012])[-/.](?:19\\d{2}|20[01][0-9]|2020)\\b$";
    private static final String CUSTOMER_CODE_REGEX = "^(KH-)(\\d{4})$";
    private static final String SERVICE_CODE_REGEX = "^(DV-)(\\d{4})$";
    private static final String CONTRACT_DATE_REGEX = "^(?:0[1-9]|[12][0-9]|3[01])[-/.](?:0[1-9]|1[012])[-/.](?:19\\d{2}|20\\d{2})\\b$";
//    private static final String NUMBER_REGEX = "^[^0-]\\d*$";

    static Pattern pattern;
    static Matcher matcher;
    public Regex() {}

    public static boolean validateOfPhoneNumber (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(PHONE_NUMBER_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfIdCard (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(ID_CARD_NUMBER_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfEmail (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(EMAIL_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfBirthday (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(BIRTHDAY_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfCustomerCode (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(CUSTOMER_CODE_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfServiceCode (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(SERVICE_CODE_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfContractDate (String string) {
        if (string == null) {
            return false;
        }
        pattern = Pattern.compile(CONTRACT_DATE_REGEX);
        matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean validateOfNumberDouble (Double number) {
        if (number > 0) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean validateOfNumberInt (Integer number) {
        if (number > 0) {
            return true;
        } else {
            return false;
        }
    }
}

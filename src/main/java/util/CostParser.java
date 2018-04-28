package util;

public class CostParser {
    public static float parse(String string) {
        string = string.replaceAll("[a-zA-Zа-яА-Я ]","");
        return Float.parseFloat(string);
    }
}

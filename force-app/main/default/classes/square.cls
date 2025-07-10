/**
 * Square class for demonstration.
 */
public class square {
    public Integer side;

    public square(Integer s) {
        this.side = s;
        System.debug(LoggingLevel.INFO, 'Square created');
    }

    public Integer area() {
        System.debug(LoggingLevel.INFO, 'Calculating area');
        Integer result = side * side;
        return result;
    }
}

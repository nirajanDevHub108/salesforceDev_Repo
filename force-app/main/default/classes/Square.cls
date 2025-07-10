public class Square {
    public Integer side;

    /**
     * used to calculate square side.
     */
    public Square(Integer s) {
        this.side = s;
        System.debug(LoggingLevel.INFO, 'Square created');
    }

    /**
     * Calculates the area of the square.
     * return Integer The area of the square.
     */
    public Integer area() {
        System.debug(LoggingLevel.INFO, 'Calculating area');
        Integer result = side * side;
        return result;
    }
}

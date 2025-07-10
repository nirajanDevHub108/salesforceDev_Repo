public class Square {
    public Integer side;

    /**
     * @description Constructor for Square class.
     * @param s The length of the side of the square.
     */
    public Square(Integer s) {
        this.side = s;
        System.debug(LoggingLevel.INFO, 'Square created');
    }

    /**
     * @description Calculates the area of the square.
     * @return Integer The area of the square.
     */
    public Integer area() {
        System.debug(LoggingLevel.INFO, 'Calculating area');
        Integer result = side * side;
        return result;
    }
}

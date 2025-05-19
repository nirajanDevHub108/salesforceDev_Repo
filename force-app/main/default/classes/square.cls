public with sharing class square {
    
    //method1 
    //default constructor
    
    public  static void area() {
        Decimal a=5, area ;
        area = a * a;
        System.debug('Area of Square : ' +area );

    }
    // method 2
        public static void perimeter() {
        Decimal a=5,  peri ;
        peri= 4 * a;
        System.debug('Perimeter : ' +peri );

    }
    
}
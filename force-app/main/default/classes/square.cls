public with sharing class square {
    Decimal a ;
    //method1 
    //default constructor
    public square(Decimal a){//parametrized constructor
        this.a = a;
    }
    
    public  void area() {
        Decimal area ;
        area = a * a;
        System.debug('Area of Square : ' +area );

    }
    // method 2
        public  void perimeter() {
        Decimal  peri ;
        peri= 4 * a;
        System.debug('Perimeter : ' +peri );

    }
    
}
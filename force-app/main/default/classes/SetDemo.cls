public class SetDemo {
    public static void method1 (){
        Set<String> s1 = new Set<String>();
        // Add two strings to it
        s1.add('item1');
        s1.add('item2');
        s1.add('item3');
        System.debug ( 'set contains -' + s1);
        
        Set<String> s2 = new Set<String>(s1);
        // The set elements in s2 are copied from s1
        System.debug ( 'set contains -' + s2);
        
        
    }
    public static void method2 ()
    {
        List<Integer> ls = new List<Integer>();
        ls.add(29);
        ls.add(34);
        // Create a set based on a list
        Set<Integer> s1 = new Set<Integer>(ls);
        System.debug(s1);
        
        Set<String> myString = new Set<String>{'a', 'b', 'c'};
            Boolean result = myString.add('b');
        System.AssertEquals(false, result);
        
        //addAll method
        Set<String> myString1 = new Set<String>{'a', 'b'};
        Set<String> sString = new Set<String>{'c'};
                
        system.debug(myString1.addAll(sString));
        
    }    
    public static void method3(){
        Set<Id> accIds = new Set<Id>();  
        List<Account>  accList = new List<Account>();
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        
        for (Account acc : accList){
            accIds.add(acc.Id);
        }
        
        System.debug('id of account in set - ' +accIds);
    
    }
    
}
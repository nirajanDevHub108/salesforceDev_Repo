public class Mapdemo {
    
    public static void sObjectDemo(){
        List<Account> accList = new List<Account>();

        accList=[SELECT Id, Name, Phone FROM Account LIMIT 5];
         //Map<Id,Account> accMap =new Map<Id,Account>(accList);
        Map<Id,Account> accMap =new Map<Id,Account>();
        for (Account acc: accList){
            accMap.put(acc.id,acc);
        }        
        system.debug('Map conatins- '+accMap);
        system.debug('Map keys- '+accMap.keySet());
        system.debug('Map values - '+accMap.values());
        
    }
    public static void method1(){
        Map <Integer,String> mp =new Map<Integer,String>();
        Map <Integer,String> mp2 =new Map<Integer,String>();
        mp.put(1,'Blue');
        mp.put(2,'Black');
        mp.put(3,'Brown');
        mp.put(4,'yellow');
        System.debug('Map Contains-' +mp);
        mp2.put(10,'white');
        mp2.put(6,'gray');
        System.debug('Map Contains-' +mp2);
        mp.putAll(mp2);
        System.debug('Map Contains -' +mp);
        
        System.debug(mp.get(1));
        
    }
    public static void methodTest(){
        // Create a generic sObject variable.
        SObject sObj = Database.query('SELECT Id FROM Account LIMIT 1');
        
        // Verify if that sObject variable is an Account token.
        System.assertEquals(Account.sObjectType, sObj.getSObjectType());
        
        // Create a map of generic sObjects 
        Map<Integer, Account> m = new Map<Integer, Account>();
        
        // Verify if the map contains Account tokens.
        System.assertEquals(Account.sObjectType, m.getSObjectType());
        
        
        
        Map<String, String> colorCodes = new Map<String, String>();
        
        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');
        
        Set <String> colorSet = new Set<String>();
        colorSet = colorCodes.keySet();
        System.debug(colorSet);
    }
    public static void method3(){
        List<Account> accList=[SELECT Id, Name,phone FROM Account LIMIT 5];
        
        
        if(!accList.isEmpty()){
            System.debug('List contains -'+accList);
            
        }else{
            System.debug('List is null-');
            
        }
        
    }
    
    
}
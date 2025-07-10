public class Mapdemo {
    
    public static void sObjectDemo(){
        List<Account> accList = new List<Account>();
        accList=[SELECT Id, Name, Phone FROM Account LIMIT 5];
        Map<Id,Account> accMap =new Map<Id,Account>();
        for (Account acc: accList){
            accMap.put(acc.id,acc);
        }        
        System.debug(LoggingLevel.INFO, 'Map conatins- ' + accMap);
        System.debug(LoggingLevel.INFO, 'Map keys- ' + accMap.keySet());
        System.debug(LoggingLevel.INFO, 'Map values - ' + accMap.values());
    }

    public static void method1(){
        Map <Integer,String> mp =new Map<Integer,String>();
        Map <Integer,String> mp2 =new Map<Integer,String>();
        mp.put(1,'Blue');
        mp.put(2,'Black');
        mp.put(3,'Brown');
        mp.put(4,'yellow');
        System.debug(LoggingLevel.INFO, 'Map Contains-' + mp);
        mp2.put(10,'white');
        mp2.put(6,'gray');
        System.debug(LoggingLevel.INFO, 'Map Contains-' + mp2);
        mp.putAll(mp2);
        System.debug(LoggingLevel.INFO, 'Map Contains -' + mp);
        System.debug(LoggingLevel.INFO, mp.get(1));
    }

    public static void methodTest(){
        SObject sObj = Database.query('SELECT Id FROM Account LIMIT 1');
        System.assertEquals(Account.sObjectType, sObj.getSObjectType());
        Map<Integer, Account> m = new Map<Integer, Account>();
        System.assertEquals(Account.sObjectType, m.getSObjectType());
        Map<String, String> colorCodes = new Map<String, String>();
        colorCodes.put('Red', 'FF0000');
        colorCodes.put('Blue', '0000A0');
        Set <String> colorSet = new Set<String>();
        colorSet = colorCodes.keySet();
        System.debug(LoggingLevel.INFO, colorSet);
    }

    public static void method3(){
        List<Account> accList=[SELECT Id, Name,phone FROM Account LIMIT 5];
        Set<Id> accids = new Set<Id>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        if(!accList.isEmpty()){
            for(Account acc: accList){
                System.debug(LoggingLevel.INFO, acc.Id + ' ' + acc.Name);
                accids.add(acc.Id);
                accMap.put(acc.id,acc);
            }
        }
        if(!accids.isEmpty()){
            for(Id accId: accids){
                System.debug(LoggingLevel.INFO, accId);
            }
        }
        if(!accMap.isEmpty()){
            for(Id accId: accMap.keySet()){
                System.debug(LoggingLevel.INFO, accId);
            }
        }
        if(!accMap.isEmpty()){
            for(Account acc: accMap.values()){
                System.debug(LoggingLevel.INFO, acc);
            }
        }
    }
}

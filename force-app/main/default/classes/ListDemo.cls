public class ListDemo {
    
    
    public static void sObjectDemo(){
        List<Account> accList = new List<Account>();
        
        Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name='Acc122';
        acc2.Active__c='Yes';
        accList.add(acc2);
        insert accList;
    }
        public static void sObjectQueryDemo(){
        List<Account> accList = new List<Account>();
        
        Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name='Acc122';
        acc2.Active__c='Yes';
        accList.add(acc2);
        insert accList;
    }
    public static List<String> returnDemo(){
        List<String> colors = new List<String>{'Red','Yellow','Blue'};
        
        return colors;
    }
    public static void listDemoMethod(){
        List<String> returnedValues = new List<String>();
        returnedValues = returnDemo();
        System.debug('ReturnedValues list conatins = ' +returnedValues);
        
        List<String> colors = new List<String>();
        colors.add('Red');
        colors.add('yellow');
        colors.add('Blue');
        colors.add('White');
        System.debug('ListDemo list conatins = ' +colors);
        
        List<String> cloneList = new List<String>();
        cloneList = colors.clone();
        System.debug('CloneList list conatins = ' +cloneList);
        
        
        System.debug(colors.equals(cloneList));
        System.debug('CloneList list conatins = ' +colors.get(1));
        System.debug('CloneList list conatins = ' +colors.indexOf('Blue'));
        System.debug('CloneList list conatins = ' +colors.isEmpty());
        
    }
    
    
}
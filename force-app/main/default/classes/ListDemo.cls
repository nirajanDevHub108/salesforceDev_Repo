/**
 * Demonstrates various List operations and SOQL/DML usage on Account.
 */
public with sharing class ListDemo {

    /**
     * Demonstrates creating Account records and adding them to a List, then inserting them.
     */
    public static void sObjectDemo() {
        List<Account> accList = new List<Account>();

        Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
        accList.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'Acc122';
        acc2.Active__c = 'Yes';
        accList.add(acc2);

        insert accList;
    }

    /**
     * Demonstrates creating Account records, adding them to a List, and inserting them (similar to sObjectDemo).
     */
    public static void sObjectQueryDemo() {
        List<Account> accList = new List<Account>();

        Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
        accList.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'Acc122';
        acc2.Active__c = 'Yes';
        accList.add(acc2);

        insert accList;
    }

    /**
     * Returns a List of color names as strings.
     * @return List<String> A list containing 'Red', 'Yellow', 'Blue'
     */
    public static List<String> returnDemo() {
        List<String> colors = new List<String>{'Red', 'Yellow', 'Blue'};
        return colors;
    }

    /**
     * Demonstrates various List operations including cloning, comparison, and basic List methods.
     */
    public static void listDemoMethod() {
        List<String> returnedValues = new List<String>();
        returnedValues = returnDemo();
        System.debug('ReturnedValues list contains = ' + returnedValues);

        List<String> colors = new List<String>();
        colors.add('Red');
        colors.add('yellow');
        colors.add('Blue');
        colors.add('White');
        System.debug('ListDemo list contains = ' + colors);

        List<String> cloneList = new List<String>();
        cloneList = colors.clone();
        System.debug('CloneList list contains = ' + cloneList);

        System.debug(colors.equals(cloneList));
        System.debug('CloneList list contains = ' + colors.get(1));
        System.debug('CloneList list contains = ' + colors.indexOf('Blue'));
        System.debug('CloneList list contains = ' + colors.isEmpty());
    }

}

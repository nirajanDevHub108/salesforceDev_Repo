/**
 * @description Demonstrates various List operations and SOQL/DML usage on Account.
 */
public with sharing class ListDemo {

    /**
     * @description Demonstrates creating Account records and adding them to a List, then inserting them.
     */
    public static void sObjectDemo() {
        // Check for create permission before inserting Accounts
        if (Schema.sObjectType.Account.isCreateable()) {
            List<Account> accList = new List<Account>();

            Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
            accList.add(acc1);

            Account acc2 = new Account();
            acc2.Name = 'Acc122';
            acc2.Active__c = 'Yes';
            accList.add(acc2);

            insert accList;
        } else {
            System.debug(LoggingLevel.WARN, 'No create permission for Account.');
        }
    }

    /**
     * @description Demonstrates creating Account records, adding them to a List, and inserting them (similar to sObjectDemo).
     */
    public static void sObjectQueryDemo() {
        // Check for create permission before inserting Accounts
        if (Schema.sObjectType.Account.isCreateable()) {
            List<Account> accList = new List<Account>();

            Account acc1 = new Account(Name = 'Acc121', Active__c = 'Yes');
            accList.add(acc1);

            Account acc2 = new Account();
            acc2.Name = 'Acc122';
            acc2.Active__c = 'Yes';
            accList.add(acc2);

            insert accList;
        } else {
            System.debug(LoggingLevel.WARN, 'No create permission for Account.');
        }
    }

    /**
     * @description Returns a List of color names as strings.
     * @return List<String> A list containing 'Red', 'Yellow', 'Blue'
     */
    public static List<String> returnDemo() {
        List<String> colors = new List<String>{'Red', 'Yellow', 'Blue'};
        return colors;
    }

    /**
     * @description Demonstrates various List operations including cloning, comparison, and basic List methods.
     */
    public static void listDemoMethod() {
        List<String> returnedValues = new List<String>();
        returnedValues = returnDemo();
        System.debug(LoggingLevel.INFO, 'ReturnedValues list contains = ' + returnedValues);

        List<String> colors = new List<String>();
        colors.add('Red');
        colors.add('yellow');
        colors.add('Blue');
        colors.add('White');
        System.debug(LoggingLevel.INFO, 'ListDemo list contains = ' + colors);

        List<String> cloneList = new List<String>();
        cloneList = colors.clone();
        System.debug(LoggingLevel.INFO, 'CloneList list contains = ' + cloneList);

        System.debug(LoggingLevel.INFO, 'Colors equals cloneList: ' + colors.equals(cloneList));
        System.debug(LoggingLevel.INFO, 'Second element in colors: ' + colors.get(1));
        System.debug(LoggingLevel.INFO, 'Index of "Blue" in colors: ' + colors.indexOf('Blue'));
        System.debug(LoggingLevel.INFO, 'Is colors list empty? ' + colors.isEmpty());
    }
}

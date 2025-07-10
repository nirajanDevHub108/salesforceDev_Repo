/**
 * @description  Demo class for practicing DML operations and relationships.
 */
public with sharing class DemoPractice {

    /**
     * @description Inserts an Account record after validating create permission.
     * @param name   Name of the Account
     * @param rating Rating of the Account
     * @param active Active status (custom field)
     * @return       The Id of the inserted Account
     */
    public static Id method1(String name, String rating, String active) {
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;

        if (Schema.sObjectType.Account.isCreateable()) {
            insert acc;
        } else {
            throw new System.DmlException('No permission to create Account.');
        }
        return acc.Id;
    }

    /**
     * @description Inserts a Contact related to a newly created Account, validating permissions.
     */
    public static void insertContact() {
        Id accId = method1('MTSC inc.', 'Warm', 'Yes');
        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = accId;

        if (Schema.sObjectType.Contact.isCreateable()) {
            insert con;
        } else {
            throw new System.DmlException('No permission to create Contact.');
        }
    }

    /**
     * @description Inserts an Account, Contact, and Opportunity, validating permissions for each.
     * @param name   Name of the Account
     * @param rating Rating of the Account
     * @param active Active status (custom field)
     */
    public static void insertAcoountWithOpp(String name, String rating, String active) {
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;

        if (Schema.sObjectType.Account.isCreateable()) {
            insert acc;
        } else {
            throw new System.DmlException('No permission to create Account.');
        }

        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = acc.Id;

        if (Schema.sObjectType.Contact.isCreateable()) {
            insert con;
        } else {
            throw new System.DmlException('No permission to create Contact.');
        }

        Opportunity opp = new Opportunity();
        opp.Name = 'Opp 101';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id;

        if (Schema.sObjectType.Opportunity.isCreateable()) {
            insert opp;
        } else {
            throw new System.DmlException('No permission to create Opportunity.');
        }
    }

    /**
     * @description Inserts an Account, Contact, Opportunity, and Case, validating permissions for each.
     * @param name1   Name of the Account
     * @param rating1 Rating of the Account
     * @param active1 Active status (custom field)
     */
    public static void insertAcoountWithOppandCase(String name1, String rating1, String active1) {
        Account acc = new Account();
        acc.Name = name1;
        acc.Rating = rating1;
        acc.Active__c = active1;

        if (Schema.sObjectType.Account.isCreateable()) {
            insert acc;
        } else {
            throw new System.DmlException('No permission to create Account.');
        }

        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = acc.Id;

        if (Schema.sObjectType.Contact.isCreateable()) {
            insert con;
        } else {
            throw new System.DmlException('No permission to create Contact.');
        }

        Opportunity opp = new Opportunity();
        opp.Name = 'Opp 101';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id;

        if (Schema.sObjectType.Opportunity.isCreateable()) {
            insert opp;
        } else {
            throw new System.DmlException('No permission to create Opportunity.');
        }

        Case cs = new Case();
        cs.Subject = 'My solar is not working';
        cs.Priority = 'High';
        cs.AccountId = acc.Id;

        if (Schema.sObjectType.Case.isCreateable()) {
            insert cs;
        } else {
            throw new System.DmlException('No permission to create Case.');
        }
    }
}

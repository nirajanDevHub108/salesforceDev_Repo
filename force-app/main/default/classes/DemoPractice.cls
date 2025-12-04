public class DemoPractice {
    
    public static Id method1(String name, String rating, String active){
        // acoun record created 
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;
        
        insert acc;//insert a account record  into the org
        
        return acc.Id;
        
    }
    //Inserting a related contact on particular account record
    public static void insertContact(){
        Id accId;
        accId = method1('MTSC inc.','Warm' ,'Yes');
        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = accId; // accountid lookup to account 
        insert con;// inserting conatct with the related account id 
    }
    public static void insertAcoountWithOpp(String name, String rating, String active){
        // acoun record created 
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;
        
        insert acc;//insert a account record  into the org
        
        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = acc.Id; // accountid lookup to account 
        insert con;
        
        Opportunity opp = new Opportunity();//instance of opp sObject
        opp.Name = 'Opp 101';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id; // linking lookup with account id
        
        insert opp ;
        
    }
    public static void insertAcoountWithOppandCase(String name1, String rating1, String active1){
        // acoun record created 
        Account acc = new Account();
        acc.Name = name1;
        acc.Rating = rating1;
        acc.Active__c = active1;
        
        insert acc;//insert a account record  into the org
        
        Contact con = new Contact();
        con.FirstName = 'MTSC inc.';
        con.LastName = 'Contact 101';
        con.AccountId = acc.Id; // accountid lookup to account 
        insert con;
        
        Opportunity opp = new Opportunity();//instance of opp sObject
        opp.Name = 'Opp 101';
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id; // linking lookup with account id
        
        insert opp ;
        
        Case cs = new Case();
        cs.Subject = 'My solar is not working';
        cs.Priority = 'High';
        cs.AccountId = acc.Id;
        insert cs;        
        
    }
    
}
public class CustomSobjectDemo {
    public static void createPosition(){
        Position__c  pos = new Position__c();
        
        pos.name ='Salesfore Architect';
        insert pos;
        
    }

}
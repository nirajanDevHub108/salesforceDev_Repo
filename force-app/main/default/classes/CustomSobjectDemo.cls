/**
 * @description Demo class for creating Position__c records.
 */
public with sharing class CustomSobjectDemo {
    /**
     * @description Creates a new Position__c record if the user has create permission.
     */
    public static void createPosition(){
        if(Schema.sObjectType.Position__c.isCreateable()) {
            Position__c pos = new Position__c();
            pos.Name = 'Salesfore Architect';
            insert pos;
        } else {
            // Optionally handle lack of permission
            throw new System.DmlException('Insufficient permissions to create Position__c.');
        }
    }
}

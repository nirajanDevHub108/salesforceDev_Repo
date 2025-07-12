/**
 * @description Handler class for LeadTrigger.
 *              Automatically creates Assessment and Position records based on Lead updates.
 */
public with sharing class LeadTriggerHandler {

    /**
     * @description Handles logic before updating Lead records.
     *              Creates related Assessment__c and Positions_Held__c records based on criteria.
     * @param newLead List of Lead records from the before update trigger.
     */
    public void onBeforeUpdate(List<Lead> newLead) {

        Id oteRecognisingRecordtypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('OTE Recognising Institution').getRecordTypeId();
        Id riAssessmentRecordtypeId = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get('RI Assessment').getRecordTypeId();
        Id resourcePositionHeldRecordtypeId = Schema.SObjectType.Positions_Held__c.getRecordTypeInfosByName().get('Resources Position Held').getRecordTypeId();

        List<SObject> recordsToInsert = new List<SObject>();

        for (Lead ld : newLead) {

            // GPA-4352: Create officialised Assessment record when form completion date is provided
            if (ld.IsConverted && ld.RecordTypeId == oteRecognisingRecordtypeId && ld.Date_of_form_completion__c != null) {
                Assessment__c ass = new Assessment__c();
                ass.RecordTypeId = riAssessmentRecordtypeId;
                ass.Account__c = ld.ConvertedAccountId;
                ass.Application_Status__c = 'Officialised';
                ass.Contact__c = ld.ConvertedContactId;
                ass.RI_Contact_Email_address__c = ld.Email;
                ass.Recognition_purpose__c = ld.Recognition_Purpose__c;
                ass.Recognition_purpose_other__c = ld.Recognition_purpose_other__c;
                ass.Recognised_OTE_levels__c = ld.Recognised_OTE_levels__c;
                ass.Proposed_date_of_recognition__c = ld.Proposed_Date_of_Recognition__c;
                ass.Website_URL__c = ld.Institution_URL__c;
                ass.Agreed_date_of_recognition__c = ld.Date_of_form_completion__c;
                ass.OwnerId = ld.OwnerId;
                ass.Source_Form_Name__c = 'OTE Recognition Form';
                recordsToInsert.add(ass);
            }

            // GPA-4227: Create basic Assessment and Position records
            else if (ld.IsConverted && ld.RecordTypeId == oteRecognisingRecordtypeId) {
                Assessment__c ass = new Assessment__c();
                ass.RecordTypeId = riAssessmentRecordtypeId;
                ass.Account__c = ld.ConvertedAccountId;
                ass.Application_Status__c = 'New';
                ass.Contact__c = ld.ConvertedContactId;
                ass.Country__c = ld.Country;
                ass.City__c = ld.City;
                ass.State_Province__c = ld.State;
                ass.OwnerId = ld.OwnerId;
                ass.Web_to_lead__c = true;
                recordsToInsert.add(ass);

                Positions_Held__c pos = new Positions_Held__c();
                pos.RecordTypeId = resourcePositionHeldRecordtypeId;
                pos.Institution__c = ld.ConvertedAccountId;
                pos.Contact__c = ld.ConvertedContactId;
                pos.Level_of_Influence__c = 'Unknown';
                pos.Job_type__c = 'Unclassified';
                pos.Job_Title__c = ld.Title;
                pos.Subject__c = 'English';
                recordsToInsert.add(pos);
            }
        }

        // ✅ PMD Security Rule: Add CRUD check before insert
        if (!recordsToInsert.isEmpty()) {
            if (Schema.sObjectType.Assessment__c.isCreateable() && Schema.sObjectType.Positions_Held__c.isCreateable()) {
                insert recordsToInsert;
            } else {
                System.debug('Insufficient permissions to insert Assessment or Position records.');
            }
        }
    }
}

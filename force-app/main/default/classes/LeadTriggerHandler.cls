/*
*********************************************************************************************************************
* Trigger Name      :  LeadTrigger 
* Class Name        :  LeadTriggerHandler
* Test class        :  LeadTriggerHandler_Test
* Purpose           :  
*********************************************************************************************************************
*/ 

 //
 public class LeadTriggerHandler {
    public void onBeforeUpdate(List<Lead> NewLead){
    
    Id oteRecognisingRecordtypeId = Schema.SObjectType.lead.getRecordTypeInfosByName().get( 'OTE Recognising Institution' ).getRecordTypeId();
    Id riAssesmentRecordtypeId = Schema.SObjectType.Assessment__c.getRecordTypeInfosByName().get( 'RI Assessment' ).getRecordTypeId();
    Id resourcePositoinHeldRecordtypeId = Schema.SObjectType.Positions_Held__c.getRecordTypeInfosByName().get( 'Resources Position Held' ).getRecordTypeId();    
        List<sObject> recordsToInsert = new List<sObject>();
        
        for(lead ld:NewLead){
            //Created as part of GPA-4352 by yuvarani from 21st line to 38th line
            if(ld.IsConverted && ld.RecordTypeId == oteRecognisingRecordtypeId && ld.Date_of_form_completion__c != null ){
                Assessment__c ass = new Assessment__c();
                ass.RecordTypeId = riAssesmentRecordtypeId;
                ass.Account__c = ld.ConvertedAccountId;
                ass.Application_Status__c = 'Officialised';
                ass.Contact__c = ld.ConvertedContactId;
                ass.RI_Contact_Email_address__c = ld.Email;
                ass.Recognition_purpose__c	= ld.Recognition_Purpose__c;
                ass.Recognition_purpose_other__c = ld.Recognition_purpose_other__c;
                ass.Recognised_OTE_levels__c = ld.Recognised_OTE_levels__c;
                ass.Proposed_date_of_recognition__c = ld.Proposed_Date_of_Recognition__c;
                ass.Website_URL__c = ld.Institution_URL__c;
                ass.Agreed_date_of_recognition__c = ld.Date_of_form_completion__c;
                ass.OwnerId = ld.OwnerId;
           		ass.Source_Form_Name__c = 'OTE Recognition Form';
                recordsToInsert.add(ass);
            }
        
          else if(ld.IsConverted && ld.RecordTypeId == oteRecognisingRecordtypeId){
                Assessment__c ass = new Assessment__c();
                ass.RecordTypeId = riAssesmentRecordtypeId;
                ass.Account__c = ld.ConvertedAccountId;
                ass.Application_Status__c = 'New';//GPA-4227 by Sharmila
                ass.Contact__c = ld.ConvertedContactId;   
                ass.Country__c = ld.Country;
                ass.City__c = ld.City;
                ass.State_Province__c = ld.State;              
                ass.OwnerId = ld.OwnerId;
                ass.Web_to_lead__c = true;
                recordsToInsert.add(ass);
                
                Positions_Held__c pos = new Positions_Held__c();
                pos.RecordTypeId= resourcePositoinHeldRecordtypeId;
                pos.Institution__c= ld.ConvertedAccountId;
                pos.Contact__c= ld.ConvertedContactId;
                pos.Level_of_Influence__c='Unknown';
                pos.Job_type__c = 'Unclassified';
                pos.Job_Title__c = ld.Title;
                pos.Subject__c ='English';
                recordsToInsert.add(pos);
                
           }           
        }
        
        insert recordsToInsert;
   }
    
}

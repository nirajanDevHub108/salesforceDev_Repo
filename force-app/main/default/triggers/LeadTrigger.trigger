trigger LeadTrigger on Lead(before update) {
  //use case 2 when lead record is updated(before update sequence) , set lead status to Working - Contatced
  //USE Case 4 whenever lead is updated and industry is healthCare, set lead souce as purchased list ,
  // SIC code as 1100 , and primary as  yes
  if (Trigger.isBefore && Trigger.isUpdate) {
    for (Lead leadRec : Trigger.NEW) {
      leadRec.Status = 'Working-Contacted';
      if (leadRec.Industry == 'Healthcare') {
        leadRec.LeadSource = 'Purchased List';
        leadRec.SICCode__c = '1100';
        leadRec.Primary__c = 'Yes';
      }
    }
  }

}

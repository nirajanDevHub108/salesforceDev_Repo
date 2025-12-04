trigger oppTrigger on Opportunity (before update) {
    //USE case5 whenever Opportunity is Closed won , create a task for the Opportunity owner to split
    //the revenue among the team with high priority
    if(Trigger.isAfter && Trigger.isUpdate){
        opportunityTriggerHandler.handleActivitesAfterUpdate(Trigger.New);
    }
    

}
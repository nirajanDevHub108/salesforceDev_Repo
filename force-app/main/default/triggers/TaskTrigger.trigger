trigger TaskTrigger on Task (before insert) {
    //when ever a task is created before insert on the task record  ,set the priorty to High
    
    if(Trigger.isInsert && Trigger.isBefore){
        //do the field update 
        for(Task taskrecord :Trigger.NEW){
            System.debug('Found Task record');
            taskrecord.Priority = 'High';//governor limit 150 DML , 100 SOQL
        }
    }
    

}
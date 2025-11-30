trigger CaseTrigger on Case(before insert) {
  //when case is created (before insert /update ) & case origin is phone . set Priority as High else
  //set priority as Low
  if (Trigger.isBefore && Trigger.isInsert) {
    for (Case caseRec : Trigger.New) {
      if (caseRec.Origin == 'Phone') {
        caseRec.Priority = 'High';
      } else {
        caseRec.Priority = 'Low';
      }
    }
  }

}

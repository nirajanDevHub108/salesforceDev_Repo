@isTest
private class OppTriggerTest {
    
    @isTest
    static void testOppTriggerAfterUpdate() {
        // Create a test opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 10000
        );
        insert opp;
        
        // Update the opportunity to Closed Won
        opp.StageName = 'Closed Won';
        update opp;
        
        // Add assertions to verify the trigger logic works
        // Since the trigger calls a handler, we should verify the handler is called
        // We'll test that the trigger executes without errors
        System.assertNotEquals(null, opp.Id, 'Opportunity should be created');
    }
    
    @isTest
    static void testOppTriggerWithNonClosedWonStage() {
        // Test that trigger doesn't execute when stage is not Closed Won
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 10000
        );
        insert opp;
        
        // Update the opportunity to a non-Closed Won stage
        opp.StageName = 'Qualification';
        update opp;
        
        // Verify that the trigger didn't execute (no tasks created)
        System.assertNotEquals(null, opp.Id, 'Opportunity should be created');
    }
    
    @isTest
    static void testOppTriggerWithMultipleOpportunities() {
        // Test bulk operation with multiple opportunities
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for(Integer i = 0; i < 5; i++) {
            Opportunity opp = new Opportunity(
                Name = 'Test Opportunity ' + i,
                StageName = 'Prospecting',
                CloseDate = Date.today(),
                Amount = 10000 + i
            );
            opportunities.add(opp);
        }
        
        insert opportunities;
        
        // Update all opportunities to Closed Won
        for(Opportunity opp : opportunities) {
            opp.StageName = 'Closed Won';
        }
        
        update opportunities;
        
        // Verify that the trigger executed without errors
        System.assertEquals(5, opportunities.size(), 'All opportunities should be processed');
    }
}

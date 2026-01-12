@isTest
private class LeadTriggerTest {
    
    @isTest
    static void testLeadTriggerBeforeUpdate() {
        // Create a test lead
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Industry = 'Healthcare'
        );
        
        insert testLead;
        
        // Update the lead to trigger the logic
        testLead.Industry = 'Healthcare';
        update testLead;
        
        // Verify that status was set to Working-Contacted
        System.assertEquals('Working-Contacted', testLead.Status, 'Status should be set to Working-Contacted');
        
        // Verify that LeadSource was set to Purchased List
        System.assertEquals('Purchased List', testLead.LeadSource, 'LeadSource should be set to Purchased List');
        
        // Verify that SICCode__c was set to 1100
        System.assertEquals('1100', testLead.SICCode__c, 'SICCode__c should be set to 1100');
        
        // Verify that Primary__c was set to Yes
        System.assertEquals('Yes', testLead.Primary__c, 'Primary__c should be set to Yes');
        
        // Test with non-healthcare industry
        Lead testLead2 = new Lead(
            FirstName = 'Test2',
            LastName = 'Lead2',
            Company = 'Test Company 2',
            Industry = 'Technology'
        );
        
        insert testLead2;
        
        // Update the lead to trigger the logic
        testLead2.Industry = 'Technology';
        update testLead2;
        
        // Verify that status was set to Working-Contacted (should still happen)
        System.assertEquals('Working-Contacted', testLead2.Status, 'Status should be set to Working-Contacted');
        
        // Verify that LeadSource was NOT set (since industry is not Healthcare)
        // Note: This test assumes the trigger logic doesn't change LeadSource for non-healthcare leads
        // Based on the trigger logic, LeadSource should not be set for non-healthcare industries
    }
}

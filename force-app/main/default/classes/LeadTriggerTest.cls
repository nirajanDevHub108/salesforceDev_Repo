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
    
    @isTest
    static void testLeadTriggerBeforeUpdateWithNonHealthcareIndustry() {
        // Test with non-healthcare industry to ensure only status is set, not other fields
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Industry = 'Technology'
        );
        
        insert testLead;
        
        // Update the lead to trigger the logic
        testLead.Industry = 'Technology';
        update testLead;
        
        // Verify that status was set to Working-Contacted
        System.assertEquals('Working-Contacted', testLead.Status, 'Status should be set to Working-Contacted');
        
        // Verify that LeadSource was NOT set (since industry is not Healthcare)
        System.assertNull(testLead.LeadSource, 'LeadSource should not be set for non-Healthcare industry');
        
        // Verify that SICCode__c was NOT set (since industry is not Healthcare)
        System.assertNull(testLead.SICCode__c, 'SICCode__c should not be set for non-Healthcare industry');
        
        // Verify that Primary__c was NOT set (since industry is not Healthcare)
        System.assertNull(testLead.Primary__c, 'Primary__c should not be set for non-Healthcare industry');
    }
    
    @isTest
    static void testLeadTriggerBeforeUpdateBulkOperation() {
        // Test bulk operation with multiple leads
        List<Lead> testLeads = new List<Lead>();
        
        // Add 3 healthcare leads
        for(Integer i = 0; i < 3; i++) {
            Lead testLead = new Lead(
                FirstName = 'Test' + i,
                LastName = 'Lead' + i,
                Company = 'Test Company ' + i,
                Industry = 'Healthcare'
            );
            testLeads.add(testLead);
        }
        
        // Add 3 non-healthcare leads
        for(Integer i = 3; i < 6; i++) {
            Lead testLead = new Lead(
                FirstName = 'Test' + i,
                LastName = 'Lead' + i,
                Company = 'Test Company ' + i,
                Industry = 'Technology'
            );
            testLeads.add(testLead);
        }
        
        insert testLeads;
        
        // Update all leads to trigger the logic
        for(Lead testLead : testLeads) {
            testLead.Industry = testLead.Industry; // Just triggering the update
        }
        
        update testLeads;
        
        // Verify results
        Integer healthcareCount = 0;
        Integer nonHealthcareCount = 0;
        
        for(Lead testLead : testLeads) {
            System.assertEquals('Working-Contacted', testLead.Status, 'Status should be set to Working-Contacted');
            
            if(testLead.Industry == 'Healthcare') {
                healthcareCount++;
                System.assertEquals('Purchased List', testLead.LeadSource, 'LeadSource should be set for Healthcare industry');
                System.assertEquals('1100', testLead.SICCode__c, 'SICCode__c should be set for Healthcare industry');
                System.assertEquals('Yes', testLead.Primary__c, 'Primary__c should be set for Healthcare industry');
            } else {
                nonHealthcareCount++;
                System.assertNull(testLead.LeadSource, 'LeadSource should not be set for non-Healthcare industry');
                System.assertNull(testLead.SICCode__c, 'SICCode__c should not be set for non-Healthcare industry');
                System.assertNull(testLead.Primary__c, 'Primary__c should not be set for non-Healthcare industry');
            }
        }
        
        System.assertEquals(3, healthcareCount, 'Should have 3 healthcare leads');
        System.assertEquals(3, nonHealthcareCount, 'Should have 3 non-healthcare leads');
    }
}

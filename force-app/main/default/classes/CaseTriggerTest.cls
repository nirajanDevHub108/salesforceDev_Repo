@isTest
private class CaseTriggerTest {
    
    @isTest
    static void testCaseTriggerBeforeInsert() {
        // Create a test case with Phone origin
        Case testCase = new Case(
            Subject = 'Test Case',
            Origin = 'Phone'
        );
        
        insert testCase;
        
        // Verify that priority was set to High
        System.assertEquals('High', testCase.Priority, 'Priority should be set to High for Phone origin');
        
        // Create a test case with non-Phone origin
        Case testCase2 = new Case(
            Subject = 'Test Case 2',
            Origin = 'Email'
        );
        
        insert testCase2;
        
        // Verify that priority was set to Low
        System.assertEquals('Low', testCase2.Priority, 'Priority should be set to Low for non-Phone origin');
    }
}

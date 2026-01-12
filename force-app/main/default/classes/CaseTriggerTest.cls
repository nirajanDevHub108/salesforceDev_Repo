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
    
    @isTest
    static void testCaseTriggerBeforeInsertWithDifferentOrigins() {
        // Test with various origins to ensure proper priority assignment
        List<Case> testCases = new List<Case>();
        
        // Test with Phone origin
        Case testCase1 = new Case(
            Subject = 'Test Case 1',
            Origin = 'Phone'
        );
        testCases.add(testCase1);
        
        // Test with Email origin
        Case testCase2 = new Case(
            Subject = 'Test Case 2',
            Origin = 'Email'
        );
        testCases.add(testCase2);
        
        // Test with Web origin
        Case testCase3 = new Case(
            Subject = 'Test Case 3',
            Origin = 'Web'
        );
        testCases.add(testCase3);
        
        // Test with Phone Call origin
        Case testCase4 = new Case(
            Subject = 'Test Case 4',
            Origin = 'Phone Call'
        );
        testCases.add(testCase4);
        
        insert testCases;
        
        // Verify priorities
        System.assertEquals('High', testCase1.Priority, 'Priority should be High for Phone origin');
        System.assertEquals('Low', testCase2.Priority, 'Priority should be Low for Email origin');
        System.assertEquals('Low', testCase3.Priority, 'Priority should be Low for Web origin');
        System.assertEquals('Low', testCase4.Priority, 'Priority should be Low for Phone Call origin');
    }
    
    @isTest
    static void testCaseTriggerBeforeInsertBulkOperation() {
        // Test bulk operation with multiple cases
        List<Case> testCases = new List<Case>();
        
        // Add 5 cases with Phone origin
        for(Integer i = 0; i < 5; i++) {
            Case testCase = new Case(
                Subject = 'Bulk Test Case ' + i,
                Origin = 'Phone'
            );
            testCases.add(testCase);
        }
        
        // Add 5 cases with Email origin
        for(Integer i = 5; i < 10; i++) {
            Case testCase = new Case(
                Subject = 'Bulk Test Case ' + i,
                Origin = 'Email'
            );
            testCases.add(testCase);
        }
        
        insert testCases;
        
        // Verify all cases have correct priorities
        for(Case testCase : testCases) {
            if(testCase.Origin == 'Phone') {
                System.assertEquals('High', testCase.Priority, 'Priority should be High for Phone origin');
            } else {
                System.assertEquals('Low', testCase.Priority, 'Priority should be Low for non-Phone origin');
            }
        }
    }
}

@isTest
private class TaskTriggerTest {
    
    @isTest
    static void testTaskTriggerBeforeInsert() {
        // Create a test task
        Task testTask = new Task(
            Subject = 'Test Task',
            Status = 'Not Started'
        );
        
        insert testTask;
        
        // Verify that priority was set to High
        System.assertEquals('High', testTask.Priority, 'Priority should be set to High');
    }
}

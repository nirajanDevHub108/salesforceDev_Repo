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
    
    @isTest
    static void testTaskTriggerBeforeInsertWithMultipleTasks() {
        // Test bulk operation with multiple tasks
        List<Task> testTasks = new List<Task>();
        
        for(Integer i = 0; i < 5; i++) {
            Task testTask = new Task(
                Subject = 'Bulk Test Task ' + i,
                Status = 'Not Started'
            );
            testTasks.add(testTask);
        }
        
        insert testTasks;
        
        // Verify all tasks have priority set to High
        for(Task testTask : testTasks) {
            System.assertEquals('High', testTask.Priority, 'Priority should be High for all tasks');
        }
    }
    
    @isTest
    static void testTaskTriggerBeforeInsertWithDifferentStatuses() {
        // Test with various task statuses to ensure priority is always set to High
        List<Task> testTasks = new List<Task>();
        
        Task testTask1 = new Task(
            Subject = 'Test Task 1',
            Status = 'Not Started'
        );
        testTasks.add(testTask1);
        
        Task testTask2 = new Task(
            Subject = 'Test Task 2',
            Status = 'In Progress'
        );
        testTasks.add(testTask2);
        
        Task testTask3 = new Task(
            Subject = 'Test Task 3',
            Status = 'Completed'
        );
        testTasks.add(testTask3);
        
        insert testTasks;
        
        // Verify all tasks have priority set to High regardless of status
        System.assertEquals('High', testTask1.Priority, 'Priority should be High for Task 1');
        System.assertEquals('High', testTask2.Priority, 'Priority should be High for Task 2');
        System.assertEquals('High', testTask3.Priority, 'Priority should be High for Task 3');
    }
    
    @isTest
    static void testTaskTriggerBeforeInsertWithNullValues() {
        // Test with null values to ensure robustness
        Task testTask = new Task(
            Subject = null,
            Status = 'Not Started'
        );
        
        insert testTask;
        
        // Verify that priority was set to High
        System.assertEquals('High', testTask.Priority, 'Priority should be set to High even with null subject');
    }
    
    @isTest
    static void testTaskTriggerBeforeInsertBulkEdgeCases() {
        // Test bulk operation with edge cases
        List<Task> testTasks = new List<Task>();
        
        // Add tasks with different subjects
        for(Integer i = 0; i < 3; i++) {
            Task testTask = new Task(
                Subject = 'Edge Case Task ' + i,
                Status = 'Not Started'
            );
            testTasks.add(testTask);
        }
        
        // Add a task with empty subject
        Task emptySubjectTask = new Task(
            Subject = '',
            Status = 'Not Started'
        );
        testTasks.add(emptySubjectTask);
        
        insert testTasks;
        
        // Verify all tasks have priority set to High
        for(Task testTask : testTasks) {
            System.assertEquals('High', testTask.Priority, 'Priority should be High for all tasks');
        }
    }
}

@isTest
public class AccountManagerTest {
    
    @isTest
    static void testCreateAccount() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        
        // Execute
        Account createdAccount = AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        // Verify
        System.assertNotEquals(null, createdAccount.Id, 'Account should have an ID after creation');
        System.assertEquals(testName, createdAccount.Name, 'Account name should match');
        System.assertEquals('Customer', createdAccount.Type, 'Account type should match');
        System.assertEquals('Technology', createdAccount.Industry, 'Account industry should match');
    }
    
    @isTest
    static void testUpdateAccount() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        Account createdAccount = AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        String newName = 'Updated Account ' + System.currentTimeMillis();
        
        // Execute
        Account updatedAccount = AccountManager.updateAccount(
            createdAccount.Id,
            newName,
            'Partner',
            'Financial Services'
        );
        
        // Verify
        System.assertEquals(createdAccount.Id, updatedAccount.Id, 'Account ID should remain the same');
        System.assertEquals(newName, updatedAccount.Name, 'Account name should be updated');
        System.assertEquals('Partner', updatedAccount.Type, 'Account type should be updated');
        System.assertEquals('Financial Services', updatedAccount.Industry, 'Account industry should be updated');
    }
    
    @isTest
    static void testGetAccountById() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        Account createdAccount = AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        // Execute
        Account retrievedAccount = AccountManager.getAccountById(createdAccount.Id);
        
        // Verify
        System.assertNotEquals(null, retrievedAccount, 'Retrieved account should not be null');
        System.assertEquals(createdAccount.Id, retrievedAccount.Id, 'Account IDs should match');
        System.assertEquals(testName, retrievedAccount.Name, 'Account names should match');
    }
    
    @isTest
    static void testGetAccountsByName() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        // Execute
        List<Account> accounts = AccountManager.getAccountsByName(testName);
        
        // Verify
        System.assertNotEquals(null, accounts, 'Accounts list should not be null');
        System.assert(accounts.size() > 0, 'Should find at least one account');
        System.assertEquals(testName, accounts[0].Name, 'Account name should match');
    }
    
    @isTest
    static void testDeleteAccount() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        Account createdAccount = AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        // Execute
        Boolean result = AccountManager.deleteAccount(createdAccount.Id);
        
        // Verify
        System.assertTrue(result, 'Account deletion should succeed');
        
        // Verify account is actually deleted
        Account deletedAccount = AccountManager.getAccountById(createdAccount.Id);
        System.assertEquals(null, deletedAccount, 'Deleted account should not be retrievable');
    }
    
    @isTest
    static void testDoesAccountExist() {
        // Setup
        String testName = 'Test Account ' + System.currentTimeMillis();
        AccountManager.createAccount(
            testName,
            'Customer',
            'Technology'
        );
        
        // Execute
        Boolean exists = AccountManager.doesAccountExist(testName);
        
        // Verify
        System.assertTrue(exists, 'Account should exist');
        
        // Test with non-existent account
        Boolean notExists = AccountManager.doesAccountExist('Non Existent Account');
        System.assertFalse(notExists, 'Non-existent account should not exist');
    }
}

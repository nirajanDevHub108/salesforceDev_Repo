@isTest
private class AccountManagerTest {

    @isTest
    static void testCreateAccount() {
        Account acc = AccountManager.createAccount('Test Account', 'Customer', 'Technology');
        System.assertNotEquals(null, acc.Id, 'Account Id should not be null');
        System.assertEquals('Test Account', acc.Name);
        System.assertEquals('Customer', acc.Type);
        System.assertEquals('Technology', acc.Industry);
    }

    @isTest
    static void testUpdateAccount() {
        Account acc = new Account(Name = 'Old Name', Type = 'Partner', Industry = 'Healthcare');
        insert acc;

        Account updated = AccountManager.updateAccount(acc.Id, 'New Name', 'Customer', 'Technology');
        System.assertEquals(acc.Id, updated.Id);
        System.assertEquals('New Name', updated.Name);
        System.assertEquals('Customer', updated.Type);
        System.assertEquals('Technology', updated.Industry);
    }

    @isTest
    static void testGetAccountById() {
        Account acc = new Account(Name = 'Sample', Type = 'Customer', Industry = 'Finance');
        insert acc;

        Account retrieved = AccountManager.getAccountById(acc.Id);
        System.assertNotEquals(null, retrieved);
        System.assertEquals(acc.Id, retrieved.Id);
        System.assertEquals('Sample', retrieved.Name);
    }

    @isTest
    static void testGetAccountsByName() {
        insert new Account(Name = 'Alpha Account');
        insert new Account(Name = 'Beta Account');

        List<Account> results = AccountManager.getAccountsByName('Alpha');
        System.assertEquals(1, results.size());
        System.assert(results[0].Name.contains('Alpha'));
    }

    @isTest
    static void testDeleteAccount() {
        Account acc = new Account(Name = 'To Delete', Type = 'Customer', Industry = 'Technology');
        insert acc;

        Boolean deleted = AccountManager.deleteAccount(acc.Id);
        System.assert(deleted, 'Account should be deleted');

        Account deletedAcc = [SELECT Id FROM Account WHERE Id = :acc.Id LIMIT 1];
        System.assertEquals(null, deletedAcc, 'Query should return null if account is deleted');
    }

    @isTest
    static void testDoesAccountExist() {
        insert new Account(Name = 'Existing Account');

        Boolean exists = AccountManager.doesAccountExist('Existing Account');
        System.assert(exists, 'Account should exist');

        Boolean notExists = AccountManager.doesAccountExist('NonExisting Account');
        System.assert(!notExists, 'Account should not exist');
    }
}

/**
 * @description Service class for managing Account records with common operations.
 *              Follows existing org patterns for structure, documentation, and error handling.
 */
public with sharing class AccountManager {
    
    /**
     * @description Creates a new Account with the provided details.
     * @param accountName The name of the account to create.
     * @param accountType The type of the account (e.g. Customer, Partner).
     * @param industry The industry of the account.
     * @return Account The newly created Account record.
     */
    public static Account createAccount(String accountName, String accountType, String industry) {
        Account newAccount = new Account(
            Name = accountName,
            Type = accountType,
            Industry = industry
        );
        
        try {
            insert newAccount;
            System.debug(LoggingLevel.INFO, 'Account created successfully with ID: ' + newAccount.Id);
            return newAccount;
        } catch (DmlException e) {
            System.debug(LoggingLevel.ERROR, 'Error creating account: ' + e.getMessage());
            throw e;
        }
    }
    
    /**
     * @description Updates an existing Account with the provided details.
     * @param accountId The ID of the account to update.
     * @param accountName The new name for the account.
     * @param accountType The new type for the account.
     * @param industry The new industry for the account.
     * @return Account The updated Account record.
     */
    public static Account updateAccount(Id accountId, String accountName, String accountType, String industry) {
        Account updatedAccount = new Account(
            Id = accountId,
            Name = accountName,
            Type = accountType,
            Industry = industry
        );
        
        try {
            update updatedAccount;
            System.debug(LoggingLevel.INFO, 'Account updated successfully with ID: ' + updatedAccount.Id);
            return updatedAccount;
        } catch (DmlException e) {
            System.debug(LoggingLevel.ERROR, 'Error updating account: ' + e.getMessage());
            throw e;
        }
    }
    
    /**
     * @description Retrieves an Account by its ID.
     * @param accountId The ID of the account to retrieve.
     * @return Account The retrieved Account record, or null if not found.
     */
    public static Account getAccountById(Id accountId) {
        try {
            Account account = [
                SELECT Id, Name, Type, Industry, Phone, Website, BillingCity, BillingState, 
                       ShippingCity, ShippingState, NumberOfEmployees, AnnualRevenue
                FROM Account 
                WHERE Id = :accountId 
                LIMIT 1
            ];
            return account;
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, 'Error retrieving account: ' + e.getMessage());
            return null;
        }
    }
    
    /**
     * @description Retrieves Accounts by name (partial match).
     * @param accountName The name or partial name to search for.
     * @return List<Account> The list of matching Account records.
     */
    public static List<Account> getAccountsByName(String accountName) {
        try {
            List<Account> accounts = [
                SELECT Id, Name, Type, Industry, Phone, Website, BillingCity, BillingState, 
                       ShippingCity, ShippingState, NumberOfEmployees, AnnualRevenue
                FROM Account 
                WHERE Name LIKE :('%' + accountName + '%')
                ORDER BY Name
            ];
            return accounts;
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, 'Error retrieving accounts: ' + e.getMessage());
            return new List<Account>();
        }
    }
    
    /**
     * @description Deletes an Account by its ID.
     * @param accountId The ID of the account to delete.
     * @return Boolean True if deletion was successful, false otherwise.
     */
    public static Boolean deleteAccount(Id accountId) {
        try {
            Account accountToDelete = new Account(Id = accountId);
            delete accountToDelete;
            System.debug(LoggingLevel.INFO, 'Account deleted successfully with ID: ' + accountId);
            return true;
        } catch (DmlException e) {
            System.debug(LoggingLevel.ERROR, 'Error deleting account: ' + e.getMessage());
            return false;
        }
    }
    
    /**
     * @description Checks if an Account with the given name already exists.
     * @param accountName The name of the account to check.
     * @return Boolean True if an account with that name exists, false otherwise.
     */
    public static Boolean doesAccountExist(String accountName) {
        try {
            Integer count = [
                SELECT COUNT() 
                FROM Account 
                WHERE Name = :accountName
            ];
            return count > 0;
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, 'Error checking account existence: ' + e.getMessage());
            return false;
        }
    }
}
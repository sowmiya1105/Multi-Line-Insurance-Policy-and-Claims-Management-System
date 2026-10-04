@isTest
public class AccountProcessorTest {

    @isTest
    static void testCountContacts() {

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Contact c1 = new Contact(
            FirstName = 'John',
            LastName = 'Test',
            AccountId = acc.Id
        );

        Contact c2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Test',
            AccountId = acc.Id
        );

        insert new List<Contact>{c1, c2};

        Test.startTest();

        AccountProcessor.countContacts(
            new List<Id>{acc.Id}
        );

        Test.stopTest();

        Account updatedAccount = [
            SELECT Id, Number_Of_Contacts__c
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals(
            2,
            updatedAccount.Number_Of_Contacts__c
        );
    }
}
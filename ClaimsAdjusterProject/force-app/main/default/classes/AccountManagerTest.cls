@IsTest
private class AccountManagerTest {

    @IsTest
    static void testGetAccount() {

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Contact con1 = new Contact(
            FirstName = 'John',
            LastName = 'Test',
            AccountId = acc.Id
        );

        Contact con2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Test',
            AccountId = acc.Id
        );

        insert new List<Contact>{con1, con2};

        RestRequest request = new RestRequest();

        request.requestUri =
            '/services/apexrest/Accounts/' +
            acc.Id +
            '/contacts';

        request.httpMethod = 'GET';

        RestContext.request = request;

        Account result = AccountManager.getAccount();

        System.assertNotEquals(null, result);
        System.assertEquals(acc.Id, result.Id);
        System.assertEquals('Test Account', result.Name);

        System.assertEquals(2, result.Contacts.size());
    }
}
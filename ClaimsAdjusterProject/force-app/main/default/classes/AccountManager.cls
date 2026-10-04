@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {

        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substring(
            request.requestURI.indexOf('/Accounts/') + 10
        );

        accountId = accountId.substring(
            0,
            accountId.indexOf('/contacts')
        );

        Account result = [
            SELECT Id, Name,
                (SELECT Id, Name FROM Contacts)
            FROM Account
            WHERE Id = :accountId
        ];

        return result;
    }
}
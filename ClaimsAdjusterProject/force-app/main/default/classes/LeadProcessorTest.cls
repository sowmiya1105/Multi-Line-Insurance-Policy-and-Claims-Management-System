@isTest
public class LeadProcessorTest {

    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();

        // insert 200 leads
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'Lead ' + i,
                Company = 'Lead',
                Status = 'Open - Not Contacted'
            ));
        }

        insert leads;
    }

    static testMethod void test() {
        Test.startTest();

        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);

        Test.stopTest();

        // After the testing stops, assert records were updated properly
        System.assertEquals(
            200,
            [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']
        );
    }
}
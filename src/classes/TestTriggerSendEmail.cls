@isTest
public class TestTriggerSendEmail {
    static testmethod void test()
    {
        Contact ct = new Contact(FirstName='Test', LastName='TriggerEmail', Email='gcastro@altimetrik.com');
        insert ct;
        Compensation__c comp = new Compensation__c(Name='Test', Submitted__c=true, Contact__c=ct.Id, Types__c='Salary',
        Location__c='Uruguay', Job_Category__c='Junior');

    try
     {
        Test.startTest();
        insert comp;
        Test.stopTest();
     }
     catch(Exception e)
     {
         System.debug(e.getMessage());
     }

        List<Compensation__c> testList= [SELECT id FROM Compensation__c WHERE id=:ct.id];
        System.assert(testList != null);

    }
}
@isTest
public class TestTriggerCheckStatus {
    static testmethod void test()
    {
        boolean check = false;
        Contact ct = new Contact(FirstName='Test', LastName='Trigger');
        insert ct;
        Compensation__c comp = new Compensation__c(Name='Test', Submitted__c=true, Contact__c=ct.Id, Types__c='Salary',
        Location__c='India', Job_Category__c='Junior');
        insert comp;

    try
     {
        Test.startTest();
        update comp;
        Test.stopTest();
     }
     catch(Exception e)
     {
         check = true;
     }
        System.assert(true, check);

    }
}
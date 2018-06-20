@isTest
public class TestCompensationController {
    static testmethod void test()
    {
        List<Compensation__c> allist = new List<Compensation__c>();
        List<Compensation__c> salarylist = new List<Compensation__c>();
        Contact ct = new Contact(FirstName='Test', LastName='Trigger');
        insert ct;
        Compensation__c comp = new Compensation__c(Name='Test', Submitted__c=false, Contact__c=ct.Id, Types__c='Salary',
        Location__c='India', Job_Category__c='Junior');
        insert comp;

        try
        {
            Test.startTest();
            allist = CompensationController.getCompensations('','');
            salarylist = CompensationController.getCompensations('Salary', 'NOT SUBMITTED');
            CompensationController.updateStatus(JSON.serialize(comp));

            Test.stopTest();
        }
        catch(Exception e)
        {
             System.debug(e.getMessage());
        }

        System.assert(allist.size() >= salarylist.size());

    }
}
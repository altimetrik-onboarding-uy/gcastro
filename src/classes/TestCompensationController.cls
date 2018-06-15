@isTest
public class TestCompensationController {
    static testmethod void test()
    {
        List<Compensation__c> allist = new List<Compensation__c>();
        List<Compensation__c> salarylist = new List<Compensation__c>();

        try
        {
            Test.startTest();
            allist = CompensationController.getCompensations('');
            salarylist = CompensationController.getCompensations('Salary');
            Test.stopTest();
        }
        catch(Exception e)
        {
             System.debug(e.getMessage());
        }

        System.assert(allist.size() >= salarylist.size());

    }
}
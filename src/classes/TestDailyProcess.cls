@isTest
public class TestDailyProcess {

    static testmethod void test(){
        List<Compensation__c> compensationList = new List<Compensation__c>();
      
        Contact ct = new Contact(FirstName='Test', LastName='ScheduledProcess');
        insert ct;
        
        for(Integer i=0;i<20;i++){ 
            Compensation__c c = new Compensation__c(Name='Test'+i, Submitted__c=false, Contact__c=ct.Id, Types__c='Salary',
            Location__c='Uruguay', Job_Category__c='Junior');
            compensationList.add(c);
        }
        
        Insert compensationList;

        Test.startTest();
        SchedulableContext sc = null;
		BatchProcess batch = new BatchProcess();
        batch.execute(sc);
        Test.stopTest();

	}
}
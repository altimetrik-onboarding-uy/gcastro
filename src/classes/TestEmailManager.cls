@isTest
public class TestEmailManager {
	 static testmethod void test()
     {
         Test.startTest();
         EmailManager.sendMail('gcastro@altimetrik.com', 'TestEmailManager', 'Test');
         Test.stopTest();
     }
}
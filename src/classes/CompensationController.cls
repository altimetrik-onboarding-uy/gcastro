public class CompensationController {
	@AuraEnabled
  	public static List<Compensation__c> getCompensations(String filter) {
      List<Compensation__c> listC = new List<Compensation__c>();
      if(filter == '')
      {
        listC = [SELECT Contact__r.Name, Contact__r.Birthdate ,Job_Category__c, Types__c, Amount__c, Location__c, Office__c, Submitted__c, Status__c
                FROM Compensation__c];
      }
      else
      {
        listC = [SELECT Contact__r.Name, Contact__r.Birthdate ,Job_Category__c, Types__c, Amount__c, Location__c, Office__c, Submitted__c, Status__c
                FROM Compensation__c WHERE Types__c =:filter];
      }
    return listC;
  }
}
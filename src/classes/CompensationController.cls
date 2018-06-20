public class CompensationController {
	@AuraEnabled
  	public static List<Compensation__c> getCompensations(String type, String submitted) {

      List<String> filterType = new List<String>();
      filterType.add('Salary');
      filterType.add('Study');
      filterType.add('Research');

      List<String> filterSubmitted = new List<String>();

      filterSubmitted.add('SUBMITTED');
      filterSubmitted.add('NOT SUBMITTED');

      if(type != '')
      {
        filterType = new list<String>();
        filterType.add(type);
      }
      if(submitted != '')
      {
        filterSubmitted = new list<String>();
        filterSubmitted.add(submitted);
      }

    return [SELECT Contact__r.Name, Contact__r.Birthdate ,Job_Category__c, Types__c, Amount__c, Location__c, Office__c, Submitted__c, Status__c
                FROM Compensation__c 
                WHERE (Status__c IN :filterSubmitted 
                AND Types__c IN :filterType )];
  }

  @AuraEnabled
  public static void updateStatus(String strFilters)
  {
      Compensation__c comps = (Compensation__c)System.JSON.deserializeStrict(strFilters, Compensation__c.Class);
      comps.Submitted__c = true;
      update comps;
  }
}
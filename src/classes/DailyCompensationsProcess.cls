global class DailyCompensationsProcess implements Database.Batchable<sObject>
{

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Submitted__c FROM Compensation__c WHERE CreatedDate <= LAST_N_DAYS:2 AND Submitted__c = false'
        );
    }

    global void execute(Database.BatchableContext bc, List<Compensation__c> scope){
        List<Compensation__c> compList = new List<Compensation__c>();
        for (Compensation__c comp : scope) {
            comp.Submitted__c = true;
            compList.add(comp);
        }   
        update compList;
    }    

    global void finish(Database.BatchableContext bc){
            
    }    
}
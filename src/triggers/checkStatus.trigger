trigger checkStatus on Compensation__c (before update, before delete) {
	For (Compensation__c c : Trigger.Old) {
		if(c.get('Submitted__c') == true) {
			Compensation__c newRecord = Trigger.newMap.get(c.Id);
			if (newRecord != null) {
				newRecord.AddError('Compensation cannot be modified or deleted, because it was submitted.');
			}
			
		}

	}
}
({
	editContact : function(component) {
		var editRecordEvent = $A.get("e.force:editRecord");
		editRecordEvent.setParams({
				"recordId": component.get("v.component.Contact__c")
		});
		editRecordEvent.fire();
		},
		view : function(component){
			var sObjectEvent = $A.get("e.force:navigateToSObject");
    	sObjectEvent.setParams({
				"recordId": component.get("v.component.Id"),
        "slideDevName": 'related'
    })
    sObjectEvent.fire();
		}
})
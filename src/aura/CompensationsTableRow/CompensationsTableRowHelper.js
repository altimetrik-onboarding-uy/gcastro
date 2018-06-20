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
		},
		changeStatus : function(component){
			var action = component.get('c.updateStatus');
			action.setParams({ strFilters : JSON.stringify(component.get('v.component'))});
			console.log(JSON.stringify(component.get('v.component')));

			// Set up the callback
			var self = this;
			action.setCallback(this, function(response) {
			var state = response.getState();
			if (state === "SUCCESS") {
					// Alert the user with the value returned 
					// from the server
					//component.set('v.components', response.getReturnValue());
					console.log("Done!");
					// You would typically fire a event here to trigger 
					// client-side notification that the server-side 
					// action is complete
			}
			else if (state === "INCOMPLETE") {
					// do something
			}
			else if (state === "ERROR") {
					var errors = response.getError();
					if (errors) {
							if (errors[0] && errors[0].message) {
									console.log("Error message: " + 
													errors[0].message);
							}
					} else {
							console.log("Unknown error");
					}
			}
			});

			$A.enqueueAction(action);
			}
})
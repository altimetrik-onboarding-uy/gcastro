({
	getComponentList: function(component) {
		var action = component.get('c.getCompensations');
		var select = component.find("compensationsFilter").get("v.value");
		if(select == undefined){select = '';}
		action.setParams({ filter : select });

	  // Set up the callback
	  var self = this;
	  action.setCallback(this, function(response) {
		var state = response.getState();
		if (state === "SUCCESS") {
				// Alert the user with the value returned 
				// from the server
				component.set('v.components', response.getReturnValue());

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
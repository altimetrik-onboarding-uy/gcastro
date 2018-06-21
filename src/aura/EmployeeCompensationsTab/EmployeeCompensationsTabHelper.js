({
	getComponentList: function(component) {
		var action = component.get('c.getCompensations');
		var filterType = component.find("typeFilter").get("v.value");
		var filterSubmitted = component.find("submittedFilter").get("v.value");

		if(filterType == undefined){filterType = '';}
		if(filterSubmitted == undefined){filterSubmitted = '';}

		action.setParams({ type : filterType,  submitted : filterSubmitted});

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
	},
	convertArrayOfObjectsToCSV : function(component, objectRecords){
		var csvStringResult, counter, keys, columnDivider, lineDivider;
	 
		// check if "objectRecords" parameter is null, then return from function
		if (objectRecords == null || !objectRecords.length) {
				return null;
		 }
		// store ,[comma] in columnDivider variabel for sparate CSV values and 
		// for start next line use '\n' [new line] in lineDivider varaible  
		columnDivider = ',';
		lineDivider =  '\n';
		csvStringResult = '';

		csvStringResult += 'NAME,'+'BIRTHDATE,'+
		'JOB CATEGORY,'+'TYPE,'+'AMOUNT,'+
		'LOCATION,'+'OFFICE,'+'SUBMITTED,'+'STATUS';
		csvStringResult += lineDivider;

		for(var i=0; i < objectRecords.length; i++){   
					csvStringResult += '"'+ objectRecords[i]['Contact__r']['Name'] +'",' + 
					'"'+ objectRecords[i]['Contact__r']['Birthdate'] +'",' + 
					'"'+ objectRecords[i]['Job_Category__c'] +'",' + 
					'"'+ objectRecords[i]['Types__c'] +'",' + 
					'"'+ objectRecords[i]['Amount__c'] +'",' + 
					'"'+ objectRecords[i]['Location__c']+'",' + 
					'"'+ objectRecords[i]['Office__c'] +'",' + 
					'"'+ objectRecords[i]['Submitted__c']+'",' + 
					'"'+ objectRecords[i]['Status__c'] +'"';

				 	csvStringResult += lineDivider;
			}// outer main for loop close 
	 
	 // return the CSV formate String 
		return csvStringResult;        
}
	})
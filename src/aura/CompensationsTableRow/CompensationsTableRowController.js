({
	edit : function(component, event, helper) {
		helper.editContact(component);
	},
	viewCompensation : function(component, event, helper){
		helper.view(component);
	},

	onChangeCheckbox : function(component, event, helper){
		helper.changeStatus(component);
	}
})
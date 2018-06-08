trigger sendEmail on Compensation__c (before insert) {
    
    List<Id> contactList = new List<Id>();

     for(Compensation__c c : Trigger.new){
        contactList.add((Id)c.get('Contact__c'));
     }

     Map<Id, Contact> actualContacts = new Map<Id, Contact>( [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id IN :contactList]);

  for (Compensation__c comp : trigger.New) {

        Contact assignedContact = actualContacts.get(comp.Contact__c);
        String htmlBody = '';
        string subject = '';

        if(comp.get('Location__c') == 'Uruguay' && assignedContact.email != null)
        {
            subject = 'Compensation added!';
            htmlBody = '<html>' +
                        '<head>' +
                        '</head>' +
                        '<body bgcolor="#f6f8f1">' +
                            '<ul>' +
                                '<li>' +
                                    'Here is the information about the Compensation:<br>' +

                                    '<ul>' +
                                        '<li> Name: '+ comp.get('Name') +'</li>' +
                                        '<li> Description: '+ comp.get('Description__c') +'</li>' +
                                        '<li> Location: '+ comp.get('Location__c') +'</li>' +
                                        '<li> Office: '+ comp.get('Office__c') +'</li>' +
                                        '<li> Job Category: '+ comp.get('Job_Category__c') +'</li>' +
                                        '<li> Type: '+ comp.get('Types__c') +'</li>' +
                                        '<li> Amount: '+ comp.get('Amount__c') +'</li>' +
                                        '<li> Tax: '+ comp.get('Tax__c') +'</li>' +
                                        '<li> Start Date: '+ comp.get('Start_date__c') +'</li>' +
                                        '<li> End Date: '+ comp.get('End_date__c') +'</li>' +
                                        '<li> Status: '+ comp.get('Status__c') +'</li>' +
                                    '</ul>' +
                                '</li>' +
                            '</ul>' +
                            '<br>' +
                            '<br>' +
                            '<br>' +
                        '</body>' +
                    '</html>';

                EmailManager.sendMail(assignedContact.email, subject, htmlBody);
            }
        }
    }
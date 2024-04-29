trigger AccountTriggerDefaultContact on Account (after insert) {
    List<Contact> newContacts = new List<Contact>();
    for (Account newAccount : Trigger.new) {
        // Create a new contact with default values
        Contact newContact = new Contact(
            LastName = 'DefaultContact',
            Email = 'default@email.com',
            AccountId = newAccount.Id
        );
        newContacts.add(newContact);
    }
    // Insert the new contacts
    if (!newContacts.isEmpty()) {
        insert newContacts;
    }
}

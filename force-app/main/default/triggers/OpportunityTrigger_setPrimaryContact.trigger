trigger OpportunityTrigger_setPrimaryContact on Opportunity (before update) {
    // Collect Account Ids for Opportunities without a primary contact
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null && opp.Primary_Contact__c == null) {
            accountIds.add(opp.AccountId);
        }
    }
    
    // Query for contacts with the title 'CEO' on the collected accounts
    Map<Id, Contact> accountCEOContacts = new Map<Id, Contact>();
    for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds AND Title = 'CEO']) {
        accountCEOContacts.put(con.AccountId, con);
    }

    // Set primary contact for each Opportunity
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null && opp.Primary_Contact__c == null && accountCEOContacts.containsKey(opp.AccountId)) {
            opp.Primary_Contact__c = accountCEOContacts.get(opp.AccountId).Id;
        }
    }
}

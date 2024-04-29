trigger OpportunityTrigger_deleteCloseWonOpp on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        // Check if the opportunity is closed-won and related account's industry is Banking
        if (opp.StageName == 'Closed Won' && opp.Account.Industry == 'Banking') {
            opp.addError('Cannot delete closed opportunity for a banking account that is won');
        }
    }
}

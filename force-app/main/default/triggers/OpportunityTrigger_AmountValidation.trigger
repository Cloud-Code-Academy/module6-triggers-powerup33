
trigger OpportunityTrigger_AmountValidation on Opportunity (before update) {
    for (Opportunity opp : Trigger.new) {
        if (opp.Amount <= 5000) {
            opp.addError('Opportunity amount must be greater than 5000');
        }
    }
}

trigger AccountTriggerAddressCopy on Account (before insert) {
    for (Account newAccount : Trigger.new) {
        // Check if shipping address fields are not empty
        if (!String.isBlank(newAccount.ShippingStreet) &&
            !String.isBlank(newAccount.ShippingCity) &&
            !String.isBlank(newAccount.ShippingState) &&
            !String.isBlank(newAccount.ShippingPostalCode) &&
            !String.isBlank(newAccount.ShippingCountry)) {
                
            // Copy shipping address to billing address
            newAccount.BillingStreet = newAccount.ShippingStreet;
            newAccount.BillingCity = newAccount.ShippingCity;
            newAccount.BillingState = newAccount.ShippingState;
            newAccount.BillingPostalCode = newAccount.ShippingPostalCode;
            newAccount.BillingCountry = newAccount.ShippingCountry;
        }
    }
}
    
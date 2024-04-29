trigger AccountTriggerSetRating on Account (before insert) {
    for (Account newAccount : Trigger.new) {
        if (newAccount.Phone != null && newAccount.Website != null && newAccount.Fax != null) {
            newAccount.Rating = 'Hot';
        }
    }
}

trigger AccountTrigger on Account (before insert) {
    for (Account acc : Trigger.new) {
        // Check if the Account Type is empty
        if (String.isBlank(acc.Type)) {
            // Set the Account Type to 'Prospect'
            acc.Type = 'Prospect';
        }
    }
}

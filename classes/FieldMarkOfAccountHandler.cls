public class FieldMarkOfAccountHandler {
    public static void ChangeMark(List<Account> newAccounts, List<Account> oldAccounts) {
        Map<Id, Decimal> markByIds = new Map<Id, Decimal>();
        for (Account newaccount : newAccounts) {
            for (Account oldaccount : oldAccounts) {
                if (!(newaccount.Id == oldaccount.Id && newaccount.Mark__c != oldaccount.Mark__c)) continue; 
                markByIds.put(newaccount.Id, newaccount.Mark__c);
            }
        }
        if (markByIds.size() != NULL) {
            List<Contact> contacts = [SELECT Mark__c, AccountId FROM Contact WHERE AccountId IN :markByIds.keySet()];
            for (Contact cont : contacts) {
                cont.Mark__c = markByIds.get(cont.AccountId);
            }
            update contacts;
        }
    }
}
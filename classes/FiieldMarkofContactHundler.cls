public class FiieldMarkofContactHundler {
    public static void ChangeAccount(List<Contact> newcontacts, List<Contact> oldcontacts) {
        Map<Id, Decimal> markOfIds = new Map<Id, Decimal>();
        for (Contact newcontact : newcontacts) {
            for (Contact oldcontact : oldcontacts) {
                if (!(newcontact.Id == oldcontact.Id && newcontact.Mark__c != oldcontact.Mark__c)) continue;
                markOfIds.put(newcontact.AccountId, newcontact.Mark__c);
            }
        }
        if (markOfIds.size() != NULL) {
        	List<Account> accounts = [SELECT Id, Mark__c FROM Account WHERE Id IN :markOfIds.keySet()];
        	for (Account acc : accounts) {
                acc.Mark__c = markOfIds.get(acc.Id);
			}
        	update accounts;            
        }
    }
}
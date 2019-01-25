/**
 * Created by User on 23.10.2018.
 */

public class CheckboxPaid {
    public static void CheckboxPaidTrue(List<Payment__c> newPayments) {
        System.debug(newPayments);
        System.debug('aa');
        Set<Id> sId = new Set<Id>();
        for (Payment__c p : newPayments) {
            sId.add(p.CContract__c);
        }
        System.debug(sId);
        List<CContract__c> allcCContracts = [SELECT Id, Name, Movie__r.Status__c, RecordType.Name, Paid__c
                                             FROM CContract__c
                                             WHERE Id IN :sId];
        System.debug(allcCContracts);
        for (Integer i = 0; i < newPayments.size(); i++) {
            for (Integer j = 0; j < allcCContracts.size(); j++) {
                if (newPayments[i].CContract__c == allcCContracts[j].Id && (allcCContracts[j].RecordType.Name == 'Fixed'
                        || allcCContracts[j].RecordType.Name == 'Percent')) {
                    allcCContracts[i].Paid__c = true;
                } else if (newPayments[i].CContract__c == allcCContracts[j].Id && allcCContracts[j].RecordType.Name == 'Both'
                        && allcCContracts[j].Movie__r.Status__c == 'Finished') {
                    allcCContracts[j].Paid__c = true;
                }
            }
        }
        update allcCContracts;
    }
}
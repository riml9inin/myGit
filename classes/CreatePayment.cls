/**
 * Created by User on 23.10.2018.
 */

public with sharing class CreatePayment {
    public static void CreateNewPayment(List<CContract__c> newCContracts) {
        List<CContract__c> ccont = [SELECT Id, Name, Amount__c, Contact__r.Name
                                    FROM CContract__c
                                    WHERE (RecordType.Name = 'Fixed' OR RecordType.Name = 'Both')
                                    AND Id IN :newCContracts];
        List<Payment__c> p = new List<Payment__c>();
        for (CContract__c cc : ccont) {
            p.add(new Payment__c(Name = cc.Contact__r.Name + ' ' + cc.Name,
                                 Amount__c = cc.Amount__c,
                                 CContract__c = cc.Id,
                                 Payment_Date__c = Date.today()));
        }
        insert p;
    }

    public static void ValidationContracts(List<CContract__c> newCContracts) {

        Set<Id> MovieIds = new Set<Id>();
        Set<Id> ContactIds = new Set<Id>();
        for (CContract__c contracts : newCContracts) {
            MovieIds.add(contracts.Movie__c);
            ContactIds.add(contracts.Contact__c);
        }
        Map<Id, Movie__c> MoviesByIds = new Map<Id, Movie__c>([SELECT Id, Total_Contract_Amount__c, Budget__c, Studio__c,
                                                                (SELECT Contact__c
                                                                 FROM CContracts__r)
                                                               FROM Movie__c WHERE Id IN :MovieIds]);

        Map<Id, Contact> ContactsByIds = new Map<Id, Contact>([SELECT Id,
                                                                (SELECT End_Date__c, Start_Date__c
                                                                 FROM CContracts__r)
                                                               FROM Contact WHERE Id IN :ContactIds]);

        for (CContract__c newCContract : newCContracts) {
            if (newCContract.Amount__c != null && MoviesByIds.get(newCContract.Movie__c).Total_Contract_Amount__c
                        + newCContract.Amount__c > MoviesByIds.get(newCContract.Movie__c).Budget__c) {
                newCContract.addError('The total cost of contracts exceeds the cost of the movie budget');
            } else {
                for (CContract__c putContact : MoviesByIds.get(newCContract.Movie__c).CContracts__r) {
                    if (newCContract.Contact__c != putContact.Contact__c) continue;
                    newCContract.addError('The actor has already signed a contract for this movie');
                }
            }
            for (CContract__c putDate : ContactsByIds.get(newCContract.Contact__c).CContracts__r) {
                Boolean isDatesValid = (newCContract.Start_Date__c != null && newCContract.End_Date__c != null)
                    && !(newCContract.End_Date__c < putDate.Start_Date__c || newCContract.Start_Date__c > putDate.End_Date__c);
                    if (!isDatesValid) continue;
                    newCContract.addError('The actor already has a contract on these dates');
            }
        }
    }
}
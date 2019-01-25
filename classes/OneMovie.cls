/**
 * Created by Luda on 21.10.2018.
 */

public class OneMovie {
    public static void FinishMovie(List<Movie__c> newMovies) {
        List<CContract__c> newCContracts = [SELECT Id, Name, Percent__c, Movie__c, Contact__r.Name, Contact__r.Phone
                                            FROM CContract__c
                                            WHERE RecordType.Name = 'Both'
                                            OR RecordType.Name = 'Percent'];
        List<Payment__c> newPayments = new List<Payment__c>();
        System.debug(newCContracts);
        for (Movie__c m : newMovies) {
            for (CContract__c cc : newCContracts) {
                if (m.Status__c == 'Finished' && cc.Movie__c == m.Id) {
                    System.debug('aaa');
                    newPayments.add(new Payment__c(Name = cc.Contact__r.Name + ' ' + cc.Name,
                                                   CContract__c = cc.Id,
                                                   Amount__c = cc.Percent__c * m.Gross__c,
                                                   Payment_Date__c = Date.today()));
                }
            }
        }
        System.debug(newPayments);
        insert newPayments;
    }

}
/**
 * Created by Luda on 20.10.2018.
 */
/*https://salesforce.stackexchange.com/questions/158024/group-data-and-display-on-vf-page-use-of-rowspan*/
public class MyActor {
    public Map<Integer, List<Payment__c>> mapYear {get; set;}
    public Map<Integer, Integer> mapCount {get; set;}
    public List<Integer> yearList {get; set;}
    public Map<Integer, Decimal> mapAmount {get; set;}
    public Decimal yearAmount{get; set;}

    public MyActor() {
        mapYear = new Map<Integer, List<Payment__c>>();
        mapCount = new Map<Integer, Integer>();
        yearList = new List<Integer>();
        mapAmount = new Map<Integer, Decimal>();
        yearAmount = 0;
        getActorInfo();
    }

    public void getActorInfo() {

        List<Payment__c> result = [SELECT Amount__c, Payment_Date__c, CContract__r.Contact__c, CContract__r.Start_Date__c,
                                     CContract__r.End_Date__c, CContract__r.Movie__r.Name, CContract__r.Movie__r.Studio__r.Name
                                   FROM Payment__c
                                   WHERE CContract__r.Contact__c = :ApexPages.currentPage().getParameters().get('Id')
                                   ORDER BY Payment_Date__c];
        System.debug(result);


        for (Payment__c cc : result) {
            List<Payment__c> newPayments = new List<Payment__c>();

            if (mapYear.containsKey(cc.Payment_Date__c.year())) {
                yearAmount = yearAmount + cc.Amount__c;
                System.debug(yearAmount);
                mapAmount.put(cc.Payment_Date__c.year(), yearAmount);
                System.debug(mapAmount);
                newPayments = mapYear.get(cc.Payment_Date__c.year());
                newPayments.add(cc);
                mapYear.put(cc.Payment_Date__c.year(), newPayments);
                mapCount.put(cc.Payment_Date__c.year(), newPayments.size());

            } else {
                yearAmount = yearAmount + cc.Amount__c;
                System.debug(yearAmount);
                mapAmount.put(cc.Payment_Date__c.year(), yearAmount);
                System.debug(mapAmount);
                newPayments.add(cc);
                mapYear.put(cc.Payment_Date__c.year(), newPayments);
                mapCount.put(cc.Payment_Date__c.year(), newPayments.size());

            }
        }

        yearList = new List<Integer>(mapYear.keySet());
        System.debug(mapYear);
        System.debug(mapAmount);
    }

}
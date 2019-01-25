/**
 * Created by User on 02.11.2018.
 */

public with sharing class BigDiscountForEveryoneHandler {
    public static void increaseDiscount(List<Contact> contacts) {
        Decimal maxDiscount;
        List<Decimal> discounts = new List<Decimal>();
        for (Contact cont : contacts) {
            discounts.add(cont.Descount__c);
        }
        discounts.sort();
        maxDiscount = discounts[discounts.size()-1];
        System.debug(maxDiscount);
        //List<Contact> = [SELECT Descount__c FROM Contact WHERE Descount__c = NULL OR Descount__c < :maxDiscount];
        String str = 'SELECT Descount__c FROM Contact WHERE Descount__c = NULL OR Descount__c < ' +maxDiscount;
        List<Contact> offended = Database.query(str);
        System.debug(offended);
        for (Contact off : offended) {
            off.Descount__c = maxDiscount;
        }
        update offended;
    }
}
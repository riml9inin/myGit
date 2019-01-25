/**
 * Created by User on 23.10.2018.
 */

trigger CreatePaymentTr on CContract__c (after update, after insert, before insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        CreatePayment.CreateNewPayment(Trigger.new);
    }
    if (Trigger.isBefore && Trigger.isInsert) {
        CreatePayment.ValidationContracts(Trigger.new);
    }

}
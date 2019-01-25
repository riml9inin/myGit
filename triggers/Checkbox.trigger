/**
 * Created by User on 23.10.2018.
 */

trigger Checkbox on Payment__c (after update, after insert ) {
    if (Trigger.isAfter && Trigger.isInsert) {
        CheckboxPaid.CheckboxPaidTrue(Trigger.new);
    }

}
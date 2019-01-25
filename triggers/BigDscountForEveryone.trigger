/**
 * Created by User on 02.11.2018.
 */

trigger BigDscountForEveryone on Contact (before insert, before update, after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        BigDiscountForEveryoneHandler.increaseDiscount(Trigger.new);
    }

}
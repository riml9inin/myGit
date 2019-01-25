/**
 * Created by User on 15.10.2018.
 */

trigger ContactNew on Contact (after insert, after update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        TestContact.createTestContact(Trigger.new);
    }
}
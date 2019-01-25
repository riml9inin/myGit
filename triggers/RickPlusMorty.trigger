/**
 * Created by User on 16.10.2018.
 */

trigger RickPlusMorty on Contact (after insert, after update, before insert, before update) {
    if (Trigger.isAfter && Trigger.isInsert){
        RickPlusMortyHandler.CreateMorty(Trigger.new);
    }

}
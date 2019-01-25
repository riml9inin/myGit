/**
 * Created by Luda on 21.10.2018.
 */

trigger MovieOne on Movie__c (before update, after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        OneMovie.FinishMovie(Trigger.new);
    }

}
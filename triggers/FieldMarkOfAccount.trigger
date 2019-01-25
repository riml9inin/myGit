trigger FieldMarkOfAccount on Account (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        FieldMarkOfAccountHandler.ChangeMark(Trigger.new, Trigger.old);
    }

}
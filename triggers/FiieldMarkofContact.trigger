trigger FiieldMarkofContact on Contact (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        FiieldMarkofContactHundler.ChangeAccount(Trigger.new, Trigger.old);
    }
}
/**
 * Created by User on 12.10.2018.
 */

public class DMLTaskTwo {
    public void UpsertContacts() {

        List<Contact> oldContacts = [SELECT Id, Name, Title FROM Contact WHERE FirstName = 'Name'];
        List<Contact> newContacts = new List<Contact>();
        List<Contact> allContacts = new List<Contact>();

        for (Integer i = 0; i < oldContacts.size(); i++) {
            oldContacts[i].Title = 'Developer';
        }
        allContacts.addAll(oldContacts);

        for (Integer j = 0; j < 5; j++) {
            Contact c = new Contact(FirstName = 'Name',
                                    LastName = 'Name ' +(20+j),
                                    Title = 'Developer');
            newContacts.add(c);
        }
        allContacts.addAll(newContacts);
        upsert allContacts;
    }
}
/**
 * Created by User on 12.10.2018.
 */

public class DMLTaskOne {
    public void CreatContacts() {
        List<Contact> newContactsnt = new List<Contact>();
        for (Integer i=0;i<5;i++) {
            Contact c = new Contact(LastName = 'Name ' +(10+i), FirstName = 'Name');
            newContactsnt.add(c);
        }
        insert newContactsnt;
    }
}
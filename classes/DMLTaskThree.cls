/**
 * Created by User on 12.10.2018.
 */

public class DMLTaskThree {
    public void DeleteContacts() {
        List<Contact> delContacts = [SELECT Id, FirstName FROM Contact WHERE FirstName='Name'];
        delete delContacts;
    }
}
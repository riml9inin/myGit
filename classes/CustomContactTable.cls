/**
 * Created by User on 12.10.2018.
 */

public class CustomContactTable {

    public List<Contact> getContacts() {
        List<Contact> contList = [SELECT Name, Email, Phone FROM Contact];
        return contList;
    }
}
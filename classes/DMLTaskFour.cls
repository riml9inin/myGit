/**
 * Created by User on 12.10.2018.
 */

public class DMLTaskFour {
    public void RecoveryContacts() {
        List<Contact> recContacts = [SELECT Id, FirstName FROM Contact WHERE FirstName='Name' ALL ROWS ];
        undelete recContacts;
    }

}
/**
 * Created by User on 02.11.2018.
 */

public class Training {
    static Integer a =0;

    public static List<Contact> FreeRicks() {
        List<Contact> freeRicks = new List<Contact>();
        List<Contact> ricks = [SELECT id, Name, (SELECT Id FROM Contacts__r)
                                FROM Contact
                                WHERE LastName = 'Sanchez'
                                AND FirstName = 'Rick'];
        for (Contact rick : ricks) {
            if (rick.Contacts__r.size() > 0) continue;
            freeRicks.add(rick);
        }
        return freeRicks;
    }

    public static List<Contact> TenContacts() {

        //String os = String.valueOf(a*10);
        Integer os = a*10; 
        String queryString = 'select Name from Contact order by name asc limit 10 offset ' + os;
        List<Contact> names = Database.query(queryString);
        a++;
        return names;
    }

    public static Map<Id, List<Contact>> createMap() {
        Map<Id, List<Contact>> contactsByIds = new Map<Id, List<Contact>>();
        for (Contact cont : [SELECT Name, AccountId FROM Contact]) {
            List<Contact> contacts = new List<Contact>();
            if (contactsByIds.containsKey(cont.AccountId)) {
                contactsByIds.get(cont.AccountId).add(cont);
            } else if (!contactsByIds.containsKey(cont.AccountId)) {
                contacts.add(cont);
                contactsByIds.put(cont.AccountId, contacts);
            }
        }
        return contactsByIds;
    }
}
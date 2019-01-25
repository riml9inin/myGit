public class TestContact {
    static Boolean b = true;
    public static void createTestContact(List<Contact> newContacts) {
        System.debug(newContacts);
        List<Contact> cont = new List<Contact>();
        if (b == true) {
            for (Contact c1 : newContacts) {
                Contact c2 = new Contact(FirstName = c1.FirstName, LastName = c1.LastName + 'test');
                System.debug(c2);
                cont.add(c2);
                System.debug(cont);
            }
            b = false;
            insert cont;
            System.debug(cont);
        }


    }
}
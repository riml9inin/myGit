public class Example5 {
    public static void func() {
        List<Contact> list1 = [SELECT Id, Name, Phone, Email FROM Contact];
        List<Contact> list1new = new List<Contact>();

        for(Contact c : list1) {
        Boolean f = false;
            for(Integer i = 0; i < list1new.size(); i++) {
                if(c.Name == list1new[i].Name) {
                    f = true;
                }
            }
            if( f != true) {
                list1new.add(c);
            }
        }
        delete list1new;

        List<Lead> list2 = [SELECT Id, Name, Phone, Email, Title FROM Lead];
        List<Lead> list2new = new List<Lead>();

        for(lead c : list2) {
            Boolean f = false;
            for(Integer i = 0; i < list2new.size(); i++) {
                if(c.Name == list2new[i].Name) {
                    f = true;
                }
            }
            if(f != true) {
                list2new.add(c);
            }
        }
        delete list2new;
    }
}
/**
 * Created by User on 18.10.2018.
 */

public class selectAllSOQLExampleController {

    public void fetch(String nameAPI, List<String> listName) {

        String commaSepratedFields = '';
        for (String fieldName : listName) {
            if (commaSepratedFields == null || commaSepratedFields == '') {
                commaSepratedFields = fieldName;
            } else {
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;
            }
        }
        //String query = ;
        List<sObject> accList = Database.query('select ' + commaSepratedFields + ' from ' + nameAPI);
        System.debug(accList);
        List<sObject> dubl = new List<SObject>();
        List<String> hashlist = new List<String>();
        for (sObject one : accList) {
            String valuehash = '';
            for (String two : listName) {
                System.debug(two);
                String znachenie = (String) one.get(two);
                System.debug(znachenie);

                //Integer z = znachenie.hashCode();
                valuehash = valuehash + znachenie;
                System.debug(valuehash);
            }
            if (hashlist.contains(valuehash)) {
                dubl.add(one);
            } else {
                hashlist.add(valuehash);
            }
        }
        delete dubl;
    }
}
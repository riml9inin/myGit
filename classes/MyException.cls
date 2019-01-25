/**
 * Created by User on 15.10.2018.
 */

public class MyException extends Exception{
    public void typeOfExc() {

        try {
            Lecture__c lect = new Lecture__c();
            insert lect;
        } catch (DmlException e) {
            System.debug('DMLException: ' +e.getMessage());
        }

        try {
            Contact lect1 = [SELECT Birthdate FROM Contact WHERE FirstName=:'Tom'];
            String str = lect1.Title;
        } catch (SObjectException e) {
            System.debug('SObjectException: ' +e.getMessage());
        }

        try {
            List<String> s = new List<String>();
            s.add('ok');
            String s1 = s[1];
        } catch (ListException e) {
            System.debug('ListException: ' +e.getMessage());
        }

        try {
            Map<String, String> colorCodes;
            Boolean contains = colorCodes.containsKey('ok');
        } catch (NullPointerException e) {
            System.debug('NullPointerException: ' +e.getMessage());
        }
    }

    public void MetodsDMLExc() {

        try {
            Account a = new Account();
            insert a;
        } catch (System.DmlException e) {
            for (Integer i = 0; i < e.getNumDml(); i++) {
                System.debug('Field mistake: ' + e.getDmlFieldNames(i));
                System.debug('Field: ' + e.getDmlFields(i));
                System.debug('Id failed row: ' + e.getDmlId(i));
                System.debug('Message failed row: ' + e.getDmlMessage(i));
                System.debug('Number of failed rows: ' + e.getNumDml());
                System.debug('Value: ' + e.getDmlType(i));
                System.debug('Original row position: ' + e.getDmlIndex(i));
            }
        }
    }

    public void EmptyField() {

        try {
            List<Account> acc = [SELECT Id, NumberOfEmployees FROM Account];
            for (Account a : acc) {
                if (a.NumberOfEmployees==NULL) throw new MyException('Blank NumberOfEmployees field');
            }
        } catch (MyException e) {
            System.debug(' ' +e.getMessage());
        }
    }
}
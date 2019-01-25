/**
 * Created by User on 16.10.2018.
 */

public with sharing class RickPlusMortyHandler {

    public static void AloneMorty() {
        List<Contact> mortyAndRick = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            Long x = Math.roundToLong(Math.random());
            if (x == 0) {
                Contact morty = new Contact(FirstName = 'Morty', LastName = 'Smith');
                mortyAndRick.add(morty);
            } else {
                Contact rick = new Contact(FirstName = 'Rick', LastName = 'Sanchez');
                mortyAndRick.add(rick);
            }
        }
        insert mortyAndRick;
    }

    public static void DeleteAllguys() {
        List<Contact> delAll = [SELECT Id, FirstName FROM Contact WHERE FirstName=:'Rick' OR FirstName=:'Morty'];
        delete delAll;
    }

    public static void CreateMorty(List<Contact> newContacts) {
        List<Contact> morty = [SELECT Id, FirstName, MyRick__c FROM Contact WHERE FirstName = 'Morty' AND Id IN :newContacts];
        List<Contact> rick = new List<Contact>();
        List<Contact> freeRick = new List<Contact>();
        List<Contact> oldRick = new List<Contact>();
        List<Contact> oldMorty = new List<Contact>();
        for (Contact sortlist : newContacts) {
            if (sortlist.FirstName == 'Rick') {
                rick.add(sortlist);
            }
        }
        for (Integer i = 0; i < Math.min(morty.size(), rick.size()); i++) {
            morty[i].MyRick__c = rick[i].Id;
        }
        if (rick.size()<morty.size()) {
            List<Contact> oldpeople = [SELECT Id, FirstName, MyRick__c FROM Contact WHERE (FirstName=:'Rick' OR FirstName=:'Morty') AND Id NOT IN :newContacts];
            for (Contact oldp : oldpeople) {
                if (oldp.FirstName == 'Rick') {
                    oldRick.add(oldp);
                } else {
                    oldMorty.add(oldp);
                }
            }
            for (Integer j=0; j<oldRick.size(); j++) {
                for (Integer i = 0; i < oldMorty.size(); i++) {
                    if (oldMorty[i].MyRick__c == oldRick[j].Id) {
                        break;
                    }
                    if (i == oldMorty.size() - 1) {
                        freeRick.add(oldRick[j]);
                    }
                }
            }
            for (Integer j = 0; j<Math.min(freeRick.size(),(morty.size()-rick.size())); j++) {
                morty[rick.size()-j].MyRick__c = freeRick[j].Id;
            }
        }
        for (Contact m1 : morty) {
            if (m1.MyRick__c==null) {
                m1.SadMorty__c = true;
            } else m1.SadMorty__c = false;
        }
        update morty;
    }
}
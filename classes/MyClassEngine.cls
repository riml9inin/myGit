/**
 * Created by User on 02.10.2018.
 */

public class MyClassEngine {
    public List<Engine__c> getEngine() {
        List<Engine__c> geng = [SELECT Id, Name FROM Engine__c];
       // System.debug(geng);
        return geng;
       
    }
     
    public List <Engine__c> getCarsInEngine() {
        List<Engine__c> gcar = [SELECT Name, (SELECT Name FROM Cars__r) FROM Engine__c];
        for (Engine__c bb : gcar) {
            List<Car__c> qq = bb.Cars__r;
            System.debug(qq);
            }
        return gcar;
        }

    public void getMap1() {
        List<Car__c> c = [SELECT Id, Engine__c FROM Car__c];
        List<Detail__c> d = [SELECT Name, Engine__c FROM Detail__c];
        Map<Id, List<Detail__c>> m = new Map<Id, List<Detail__c>>();
        for (Car__c c1 : c){
            List<Detail__c> l = new List<Detail__c>();
            for (Detail__c d1 : d) {
                if (c1.Engine__c==d1.Engine__c) {
                    l.add(d1);
                }
            }
            m.put(c1.Id, l);
        }
        System.debug(m);
    }

    public void getMap2() {
        List<Engine__c> e = [SELECT Name FROM Engine__c];
        List<Car__c> c = [SELECT Name, Engine__c FROM Car__c];
        Map<String, List<Car__c>> m = new Map<String, List<Car__c>>();
        for (Engine__c e1 : e) {
            List<Car__c> l = new List<Car__c>();
            for (Car__c c1 : c) {
                if (e1.Id==c1.Engine__c) {
                    l.add(c1);
                }
            }
            m.put(e1.Name, l);
        }
        System.debug(m);
    }

    public void ClonObjects() {
        List<Engine__c> e = [SELECT Id, Name FROM Engine__c];
        List<Car__c> c = [SELECT Id, Name FROM Car__c];
        List<Detail__c> d = [SELECT Id, Name, Engine__c FROM Detail__c];
        List<Engine__c> newe = new List<Engine__c>();
        List<Car__c>  newc = new List<Car__c>();
        List<Detail__c> newd = new List<Detail__c>();
        for (Engine__c e1 : e) {
            e1.Id = null;
            newe.add(e1);
        }
        insert newe;
        for (Car__c c1 : c) {
            c1.Id = null;
            newc.add(c1);
        }
        insert newc;
        for (Detail__c d1 : d) {
            d1.Id = null;
            newd.add(d1);
        }
        insert newd;
    }

    public void deleteDublicate() {
        List<Engine__c> engine = [SELECT Id, Name FROM Engine__c];
        List<Car__c> car = [SELECT Id, Name, Engine__c FROM Car__c];
        List<Detail__c> detail = [SELECT Id, Name, Engine__c FROM Detail__c];
        Map<String, Engine__c> mapEngine = new Map<String, Engine__c>();
        Map<String, Car__c> mapCar = new Map<String, Car__c>();
        Map<String, Detail__c> mapDetail = new Map<String, Detail__c>();
        List<Engine__c> dublEngine = new List<Engine__c>();
        List<Car__c> dublCar = new List<Car__c>();
        List<Detail__c> dublDetail = new List<Detail__c>();

        for (Engine__c e : engine) {
            if (!mapEngine.containsKey(e.Name)) {
                mapEngine.put(e.Name, e);
            }
            else {
                dublEngine.add(e);
            }
        }
        delete dublEngine;

        for (Car__c c : car) {
            if (!mapCar.containsKey(c.Name)) {
                mapCar.put(c.Name, c);
            }
            else {
                dublCar.add(c);
            }
        }
        delete dublCar;

        for (Detail__c d : detail) {
            if (!mapDetail.containsKey(d.Name)) {
                mapDetail.put(d.Name, d);
            }
            else {
                dublDetail.add(d);
            }
        }
        delete dublDetail;
    }
}
public class MyEngine {

    public List<Engine__c> addEngine() {
        List<Engine__c> eng = new List<Engine__c>();
        for (Integer i = 0; i < 100; i++) {
            Engine__c e = new Engine__c(Name = 'Engine ' + i);
            eng.add(e);
        }
        insert eng;
       return eng;
    }

    public void  del() {
        List<Engine__c> eng1 = [SELECT Id, Name FROM Engine__c];
        delete eng1;
        
    }
    public void addCar(List<Engine__c> eng1) {
        List<Car__c> car = new List<Car__c>();
        List<Detail__c> det = new List<Detail__c>();
            Integer z=0;
        	Integer x=0;
        for (Integer i = 0; i < 100; i++) {
           
            for (Integer j=0; j<3;j++){
                if (z<=300) {
            Car__c c = new Car__c(Name = 'Car ' + z, Engine__c = eng1[i].Id);
            car.add(c);
                    z++;
                }
        }
           
       for (Integer w=0; w<4;w++){
                if (x<=400) {
            Detail__c d = new Detail__c(Name = 'Detail ' + x, Engine__c = eng1[i].Id);
            det.add(d);
                    x++;

                }


        }
        }
         insert car;    
        insert det;
       
    }
   
       public void dele() {
        List<Car__c> car1 = [SELECT Id FROM Car__c];
        delete car1;
        
    }
    public void delet() {
        List<Detail__c> det1 = [SELECT Id FROM Detail__c];
        delete det1;
        
    }
 /*   public List<Detail__c> addDetail() {
        List<Detail__c> det = new List<Detail__c>();
        for (Integer i = 0; i < 5; i++) {
            Detail__c d = new Detail__c(Name = 'Detail ' + i);
            det.add(d);
        }
        insert det;
        return det;
    }*/


}
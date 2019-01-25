public class DMLTaskFive {
    public void DataBaseOperations() {
         
        List<Contact> cont = new List<Contact>();
        
        for (Integer i = 0; i < 20; i++) {
            if (i<10) {
                Contact c = new Contact (FirstName = 'Name', LastName = 'Name' +i);
                cont.add(c);
            } else {
                Contact c = new Contact (FirstName = 'Name'); 
                cont.add(c);
            }
            
        }
        //insert cont;
        Savepoint pointback = DataBase.setSavepoint();
        DataBase.SaveResult[] result = Database.insert(cont, false);
        
        System.debug(''+result.size());
        List<Id> lsi = new List<Id>();
        for (DataBase.SaveResult r : result) {
            if (r.isSuccess()) {
            	lsi.add(r.getId());                
            }          
        }
             System.debug(''+lsi);
        if (lsi.size()<cont.size()) {
            DataBase.rollback(pointback);
        }
        
    }
    
    /*public void DBD() {
        List<Contact> contdel = [SELECT Id, FirstName FROM Contact WHERE FirstName = 'Name'];
        delete contdel;
        
    }*/

}
public class STExtButton {
    /*private final Contact con;*/
    
    public STExtButton(ApexPages.StandardController stdController) {
       /* this.con = (Contact)stdController.getRecord();*/
    }
    
    public PageReference change() {
        PageReference ref = new PageReference ('/apex/ContactSTTable');
        return ref;
    }
}
/**
 * Created by User on 24.10.2018.
 */

public class ButtonContactInfo {
    public ButtonContactInfo(ApexPages.StandardController stdController) {
        /* this.con = (Contact)stdController.getRecord();*/
    }

    public PageReference Info() {
        PageReference ref = new PageReference ('/apex/ContactSTTable');
        return ref;
    }

}
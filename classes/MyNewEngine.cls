/**
 * Created by User on 03.10.2018.
 */

public class MyNewEngine {
    public String gnewEngine () {
        List<Engine__c> geng = [SELECT Id, Name FROM Engine__c];
        // System.debug(geng);
        return JSON.serialize(geng);
    }

}
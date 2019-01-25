/**
 * Created by User on 08.11.2018.
 */

global with sharing class Level3Task2ActionFunction {
    String greetingsValue;
    public String APINameObject {get; set;}
    public static List<sObject> results {get; set;}
    Engine__c engine;
    public Boolean isDisplyaBlock1 {get; set;}
    public Boolean isDisplyaBlock2 {get; set;}
    public Boolean isDisplyaBlock3 {get; set;}

    public Level3Task2ActionFunction() {
        isDisplyaBlock1 = true;
        isDisplyaBlock2 = true;
        isDisplyaBlock3 = true;
    }

    public Engine__c getEngine() {
        if (engine == null) {
            engine = new Engine__c();
        }
        return engine;
    }

    public PageReference save() {
        insert engine;
        PageReference enginePage = new ApexPages.StandardController(engine).view();
        enginePage.setRedirect(true);
        return enginePage;
    }

    public PageReference redirectToPage() {
        PageReference infoContacts = Page.PageCContactTable;
        infoContacts.setRedirect(true);
        return infoContacts;
    }

    public PageReference redirectToOnliner() {
        PageReference onliner = new PageReference('https://www.onliner.by/');
        onliner.setRedirect(true);
        return onliner;
    }

    public PageReference redirectToWikipedia() {
        PageReference wikipedia = new PageReference('https://ru.wikipedia.org');
        wikipedia.setRedirect(true);
        return wikipedia;
    }

    public PageReference redirectToGoogle() {
        PageReference google = new PageReference('https://www.google.com/');
        google.setRedirect(true);
        return google;
    }



    public String getValueButton() {
        return greetingsValue;
    }

    public PageReference clickButton() {
        String paramFromVF = ApexPages.currentPage().getParameters().get('newParam');
        greetingsValue = 'Button value is "' +paramFromVF+ '"';
        return null;
    }

    @RemoteAction
    global static List<sObject> getObjects(String APINameObject) {
        results = Database.query('SELECT Id, Name, CreatedDate FROM ' +APINameObject+ ' LIMIT 5');
        return results;
    }

    public void block1() {
        isDisplyaBlock1 = !isDisplyaBlock1;
    }

    public void block2() {
        isDisplyaBlock2 = !isDisplyaBlock2;
    }

    public void block3() {
        isDisplyaBlock3 = !isDisplyaBlock3;
    }
}
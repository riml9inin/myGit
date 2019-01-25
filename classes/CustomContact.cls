public class CustomContact {
    public Contact cont {get; set;}

    public CustomContact() {
        cont = [SELECT Id, Name FROM Contact WHERE Id=:ApexPages.currentPage().getParameters().get('id')];
    }

    public PageReference change() {
        PageReference ref = new PageReference('/apex/PageCContactTable');
        return ref;
    }
}
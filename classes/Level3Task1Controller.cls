/**
 * Created by User on 06.11.2018.
 */

public class Level3Task1Controller {
    public Id IdContact {get; set;}

    public Contact getInfoContact() {
        return [SELECT Id, Account.Name, Account.AccountNumber, Account.Phone, Account.BillingStreet,
                        Account.BillingCity, Account.BillingState, Account.Type
                FROM Contact
                WHERE Id = :IdContact];
    }
}
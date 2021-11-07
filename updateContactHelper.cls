public with sharing class updateContactHelper {
    public static void updateContactMailingAddress(List<User> userList) {
        System.debug('-- user data--'+userList);
        Set<Id> UserIds = new Set<Id>();
        List<Contact> conUpdate = new List<Contact>();
        for(User usr : userList){
            contact con = new Contact();
            con.id = usr.ContactId;
            con.mailingStreet = usr.Street;
            con.mailingCity = usr.City;
            con.mailingState = usr.State;
            con.mailingPostalCode = usr.PostalCode;
            con.mailingCountry = usr.Country;
            conUpdate.add(con);
        }
        System.debug('-- contact data--'+conUpdate);
        if(!conUpdate.isEmpty() && conUpdate.size()>0){
            try{
                database.update(conUpdate);
            }catch(Exception ex){
                System.debug('-- exception or error when Update Contact mailing address of related user--'+ex.getMessage()+ex.getLineNumber());
            }
        }
        
    }
}

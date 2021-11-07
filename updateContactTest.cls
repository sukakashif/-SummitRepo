@isTest
public with sharing class updateContactTest {
   @testSetup static void CreatData(){
    Account acc =  new Account();
    acc.Name = 'Test Account';
    insert acc;

    Contact con = new Contact();
    con.FirstName = 'Test Firstname';
    con.lastName = 'Test con';
    con.AccountId = acc.Id;
    insert con;

    Id profileId = [Select Id From Profile Where Name ='Customer Community Login User'].Id;
    User portalUser = new User(  
            FirstName = 'Test Community',  
            LastName = 'user',  
            email = 'comtest@sfdc.org',  
            Username = 'comtest@sfdc.org',  
            EmailEncodingKey = 'ISO-8859-1',  
            Alias = 'test098',  
            TimeZoneSidKey = 'America/Los_Angeles',  
            LocaleSidKey = 'en_US',  
            LanguageLocaleKey = 'en_US', 
            ContactId = con.Id,
            ProfileId = profileId
        );

        insert portalUser;
   }

   public static testMethod void testUpdateContact(){
    List<user> userList = new List<user>();
    List<User> usrList = [Select id,name , Street, City, State, PostalCode, Country FROM User Where Name='Test Community'];
    for(User us : usrList){
        us.Street = '1610 Buckthorne Drive';
        us.City = 'Allen';
        us.State = 'TX';
        us.PostalCode = '76987';
        us.Country = 'USA';
        userList.add(us);
    }
    Test.startTest();
     update userList;
    Test.stopTest();
       
   }
}
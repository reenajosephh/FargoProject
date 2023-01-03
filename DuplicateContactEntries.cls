public class DuplicateContactEntries {
@InvocableMethod(label='Get Related Contacts' description='Find duplicate records when a new interaction record is created')
    public static List<Contact> findDuplicateContact(List<Interaction__c> intnList){
        
        List<Contact> conList=new List<Contact>();
        List<Contact>duplicateList=new List<Contact>();
        List<Contact>dupeContact=new List<Contact>();
        List<String>email=new List<String>();
        List<String>lastName=new List<String>();
        for(Interaction__c intobj :intnList){
            Contact con=new Contact();
            con.FirstName=intobj.FirstName__c;
            con.LastName=intobj.Last_Name__c;
            con.Email=intobj.Email__c;
            email.add(intobj.Email__c);
            lastName.add(intobj.Last_Name__c);
            //conList=findDuplicate(con);
            
            /*if(dupeContact.size()==0)
            {
                duplicateList.add(null);
            }
            else
            {
                //duplicateList.add(conList[0]);
                duplicateList.add(dupeContact[0]);
            }*/
        }
        dupeContact=[Select Id,FirstName,LastName,Email,AccountId from Contact where LastName IN :lastName AND Email IN:email];
          if(dupeContact.size()==0)
            {
                duplicateList.add(null);
            }
            else
            {
                //duplicateList.add(conList[0]);
                duplicateList.add(dupeContact[0]);
            }  
        return duplicateList;
    }
    /*public static List<sObject> findDuplicate(Contact con){
        List<sObject> conList=new List<sObject>();
        conList.add(con);
        
        //List<Datacloud.FindDuplicatesResult> findduplicateResult=Datacloud.FindDuplicates(conList);
        List<Datacloud.DuplicateResult> duplicateresults;
        
        List<Datacloud.FindDuplicatesResult> findduplicateresult;
        findduplicateresult=Datacloud.FindDuplicates.findDuplicates(conList);
        Datacloud.DuplicateResult duplicateResult=findduplicateresult.get(0).getDuplicateResults().get(0);
        Datacloud.MatchResult matchResult=duplicateResult.getMatchResults()[0];
        //Returns information about the duplicates for the matching rule.
        List<Datacloud.MatchRecord> matchRecords= matchResult.getMatchRecords();
        
        List<sObject> duplicates=new List<sObject>();
        for(Datacloud.MatchRecord matchRecord:matchRecords)
        {
            sObject duplicate=matchRecord.getRecord();
            System.debug('Match Record'+duplicate);
            duplicates.add(duplicate);
        }
        System.debug(duplicates.size());
        system.debug(duplicates);
        
        return duplicates;
            }*/
}
public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords() {
        try {
            List<House__c> ltsHouses = [
                SELECT
                Id,
                Name,
                Address__c,
                State__c,
                City__c,
                Zip__c
                FROM House__c
                WITH USER_MODE
                ORDER BY CreatedDate
                LIMIT 10
            ];

            return ltsHouses;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
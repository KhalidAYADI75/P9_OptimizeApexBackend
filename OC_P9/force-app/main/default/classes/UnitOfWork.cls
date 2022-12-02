public class UnitOfWork {
    public List<sObject> sObjectToUpdate = new List<sObject>();
    public void updateSobject () {
        update this.sObjectToUpdate;
    }
}
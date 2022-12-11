//class that updates any object defined in the List sObjectToUpdate
public class UnitOfWork {
    public List<sObject> sObjectToUpdate = new List<sObject>();
    public void updateSobject () {
        update this.sObjectToUpdate;
    }
}
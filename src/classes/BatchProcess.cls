global class BatchProcess implements Schedulable{
	global void execute(SchedulableContext sc)
    {
        DailyCompensationsProcess b = new DailyCompensationsProcess ();
        database.executebatch(b,200);
    }
   
}
package domain;

/**
 * Created by danilo on 15/10/16.
 */
public class ScheduleBuilder {

    private Schedule schedule;

    public ScheduleBuilder(int id) {
        schedule = new Schedule(id);
    }

    public ScheduleBuilder addDayWeek(Schedule.DayWeek dayWeek) {
        schedule.setDayWeek(dayWeek);
        return this;
    }

    public ScheduleBuilder addInitSchedule(int init, int finish) {
        schedule.setInitSchedule(init, finish);

        return this;
    }

    public ScheduleBuilder addFinalSchedule(int init, int finish) {
        schedule.setFinalSchedule(init, finish);

        return this;
    }

    public Schedule getSchedule() {
        return schedule;
    }
}

package domain;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by danilo on 01/10/16.
 */


@XStreamAlias("Schedule")
public class Schedule {

    public enum DayWeek {SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY}

    private int id;
    private int initHour;
    private int initMinute;
    private int finalHour;
    private int finalMinute;

    private DayWeek dayWeek;

    public Schedule(int idParam) {
        id = idParam;
    }


    public void setInitSchedule(int initHour, int initMinute) {
        this.initHour = initHour;
        this.initMinute = initMinute;
    }

    public void setFinalSchedule(int finalHour, int finalMinute) {
        this.finalHour = finalHour;
        this.finalMinute = finalMinute;
    }

    public void setDayWeek(DayWeek dayWeek) {
        this.dayWeek = dayWeek;
    }

    public String getInitSchedule() {
        return getStrSchedule(initHour, initMinute);
    }

    public String getFinalSchedule() {
        return getStrSchedule(finalHour, finalMinute);
    }

    public DayWeek getDayWeek() {
        return dayWeek;
    }


    public String getStrDiaSemana() {
        switch (dayWeek) {
            case SUNDAY:
                return "Domingo";
            case MONDAY:
                return "Segunda";
            case TUESDAY:
                return "Terça";
            case WEDNESDAY:
                return "Quarta";
            case THURSDAY:
                return "Quinta";
            case FRIDAY:
                return "Sexta";
            case SATURDAY:
                return "Sábado";
            default:
                return "";
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInitHour() {
        return initHour;
    }

    public void setInitHour(int initHour) {
        this.initHour = initHour;
    }

    public int getInitMinute() {
        return initMinute;
    }

    public void setInitMinute(int initMinute) {
        this.initMinute = initMinute;
    }

    public int getFinalHour() {
        return finalHour;
    }

    public void setFinalHour(int finalHour) {
        this.finalHour = finalHour;
    }

    public int getFinalMinute() {
        return finalMinute;
    }

    public void setFinalMinute(int finalMinute) {
        this.finalMinute = finalMinute;
    }

    private String getStrSchedule(int hour, int minute) {
        return hour + ":" + minute;
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .append(dayWeek)
                .append(getInitSchedule())
                .append(getFinalSchedule())
                .toHashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if (o instanceof Schedule) {
            Schedule other = (Schedule) o;
            return new EqualsBuilder()
                    .append(dayWeek, other.getDayWeek())
                    .append(getInitSchedule(), other.getInitSchedule())
                    .append(getFinalSchedule(), other.getFinalSchedule())
                    .isEquals();
        } else {
            return false;
        }
    }

}

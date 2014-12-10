/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 *
 * @author JAWEN
 */
public class EmployeeKey {

    private int coins;
    private Calendar cal;
    private int index;
    private int rank;
    private String emailAddr;

    public String getEmailAddr() {
        return emailAddr;
    }

    public void setEmailAddr(String emailAddr) {
        this.emailAddr = emailAddr;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public EmployeeKey(int coins, Calendar cal) {
        super();
        this.coins = coins;
        this.cal = cal;
        this.index = 0;
    }

    public int getCoins() {
        return coins;
    }

    public void setCoins(int coins) {
        this.coins = coins;
    }

    public Calendar getCal() {
        return cal;
    }

    public void setCal(Calendar cal) {
        this.cal = cal;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getStdDate() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss:SS");
        dateFormat.setTimeZone(cal.getTimeZone());
        return dateFormat.format(cal.getTime());
    }

    @Override
    public String toString() {
        return " bet " + this.coins + " Coins at " + getStdDate();
    }
}

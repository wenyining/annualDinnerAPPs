/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import java.util.Calendar;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/**
 *
 * @author JAWEN This is used for Rank the bet result
 */
public class RankManager {

    private static final TreeMap<EmployeeKey, String> game1 = new TreeMap<EmployeeKey, String>(
            new MyKeyCmp());
    private static final TreeMap<EmployeeKey, String> game2 = new TreeMap<EmployeeKey, String>(
            new MyKeyCmp());
    private static final TreeMap<EmployeeKey, String> game3 = new TreeMap<EmployeeKey, String>(
            new MyKeyCmp());
    private static final TreeMap<EmployeeKey, String> game4 = new TreeMap<EmployeeKey, String>(
            new MyKeyCmp());

    /**
     *
     * @param coins
     * @param gameid
     * @param emp
     * @return the rank id
     */
    public static EmployeeKey insertBet(int coins, int gameid, String emp) {
        EmployeeKey ekey = new EmployeeKey(coins, Calendar.getInstance());
        int rank = 0;
        switch (gameid) {
            case 1:
                //check if this user already in it at very begginning
                if (!game1.containsValue(emp)) {
                    game1.put(ekey, emp);
                    rank = getRankIndex(ekey, game1);
                }
                break;
            case 2:
                //check if this user already in it at very begginning
                if (!game2.containsValue(emp)) {
                    game2.put(ekey, emp);
                    rank = getRankIndex(ekey, game2);
                }
                break;
            case 3:
                //check if this user already in it at very begginning
                if (!game3.containsValue(emp)) {
                    game3.put(ekey, emp);
                    rank = getRankIndex(ekey, game3);
                }
                break;
            case 4:
                //check if this user already in it at very begginning
                if (!game4.containsValue(emp)) {
                    game4.put(ekey, emp);
                    rank = getRankIndex(ekey, game4);
                }
                break;
        }
        ekey.setRank(rank);
        return ekey;
    }

    public static int getRankIndex(EmployeeKey ekey, TreeMap<EmployeeKey, String> game) {
        Set set = game.entrySet();
        // Get an iterator
        Iterator i = set.iterator();
        int index = 0;
        // Display elements
        while (i.hasNext()) {
            index++;
            Map.Entry me = (Map.Entry) i.next();
            EmployeeKey tmkey = (EmployeeKey) me.getKey();
            if (tmkey.getCoins() != ekey.getCoins()) {
                continue;
            }
            if (!tmkey.getCal().equals(ekey.getCal())) {
                continue;
            }
            if (tmkey.getIndex() != ekey.getIndex()) {
                continue;
            }
            return index;
        }
        return -1;
    }

}

/**
 * @author jawen This is used for sort by bet coins and date time. Add a index
 * for dealing with same coins and date.
 */
class MyKeyCmp implements Comparator<EmployeeKey> {

    @Override
    public int compare(EmployeeKey e1, EmployeeKey e2) {
        if (e1.getCoins() > e2.getCoins()) {
            return -1;
        } else if (e1.getCoins() < e2.getCoins()) {
            return 1;
        } else {
            if (e1.getCal().before(e2.getCal())) {
                return -1;
            } else if (e1.getCal().after(e2.getCal())) {
                return 1;
            }
            if (e1.getIndex() == e2.getIndex()) {
                e2.setIndex(e1.getIndex() + 1);
            }
            if (e1.getIndex() > e2.getIndex()) {
                return -1;
            } else {
                return 1;
            }
        }
    }
}

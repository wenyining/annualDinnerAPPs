/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oracle.annual.web;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

/**
 *
 * @author Jacky
 */
public class FileReader {

    /**
     * 使用FileWriter类写文本文件
     * @param file
     * @param str
     */
    public static void writeMethod1(String file, String str) {
        try {
                        //使用这个构造函数时，如果存在kuka.txt文件，
            //则先把这个文件给删除掉，然后创建新的kuka.txt
            FileWriter writer = new FileWriter(file, true);
            writer.write("str\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 使用BufferedReader类读文本文件
     * @return 
     */
    public static ArrayList<byte[]> readFile(String file) {
        ArrayList<byte[]> retArray = new ArrayList<byte[]>();
        String line = "";
        InputStreamReader reader;
        BufferedReader br;
        try {
            reader = new InputStreamReader(new FileInputStream(file));
            br = new BufferedReader(reader);
            line = br.readLine();
            while (line != null) {
                System.out.println(line);
                retArray.add(line.getBytes("utf-8"));
                line = br.readLine();
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return retArray;
    }
    
    
    public static ArrayList<String> readFile2String(String file) {
        ArrayList<String> retArray = new ArrayList<String>();
        String line = "";
        InputStreamReader reader;
        BufferedReader br;
        try {
            reader = new InputStreamReader(new FileInputStream(file));
            br = new BufferedReader(reader);
            line = br.readLine();
            while (line != null) {
                System.out.println(line);
                retArray.add(line);
                line = br.readLine();
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return retArray;
    }
}

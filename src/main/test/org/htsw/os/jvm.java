package org.htsw.os;

/**
 * Created by lisa-zlx on 2015/6/21.
 */
public class jvm {
    public static void main(String args[]){
        System.out.println(Runtime.getRuntime().freeMemory()/1024.0/1024.0);
        System.out.println(Runtime.getRuntime().totalMemory()/1024.0/1024.0);
        System.out.println(Runtime.getRuntime().maxMemory()/1024.0/1024.0);
    }
}

package org.htsw.os;

import org.apache.commons.lang.SystemUtils;

/**
 * Created by lisa-zlx on 2015/6/21.
 */
public class TestOS {
    public static void main(String args[]){

        System.out.println(SystemUtils.JAVA_VENDOR);//Oracle Corporation
        System.out.println(SystemUtils.JAVA_VERSION);//1.8.0_25
        System.out.println(SystemUtils.OS_VERSION);//6.2
        System.out.println(SystemUtils.OS_ARCH);//amd64
        System.out.println(SystemUtils.OS_NAME);//Windows 8
        System.out.println(SystemUtils.USER_COUNTRY);//CN
        System.out.println(SystemUtils.JAVA_HOME);//C:\dev\Java\jdk1.8.0_25\jre
        System.out.println(SystemUtils.JAVA_RUNTIME_NAME);//Java(TM) SE Runtime Environment

        System.out.println(SystemUtils.JAVA_VM_INFO);//mixed mode
        System.out.println(SystemUtils.JAVA_VM_NAME);//Java HotSpot(TM) 64-Bit Server VM
        System.out.println(SystemUtils.JAVA_VM_VERSION);//25.25-b02
        System.out.println(SystemUtils.JAVA_VM_VENDOR);//Oracle Corporation
        System.out.println(SystemUtils.JAVA_VM_SPECIFICATION_NAME);//Java Virtual Machine Specification



    }
}

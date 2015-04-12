package com.sf.kits.map;

import java.util.List;

public class MapUitl {
    /**
     * 判断是否为空
     * 若为空，返回true
     * 不为空，返回false
     *
     * @param list
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static boolean isNullNorEmpty(List list) {
        return list == null || list.size() <= 0;
    }
}

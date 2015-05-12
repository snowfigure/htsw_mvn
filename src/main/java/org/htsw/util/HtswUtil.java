package org.htsw.util;

/**
 * 恒通商务普通util
 * Created by snowfigure on 2015/5/11.
 */
public class HtswUtil {
    /**
     * @param shortStyle 2012-11格式
     * @return 2012年11月
     */
    public static String timeFormatToCNStyle(String shortStyle) {
        if (shortStyle == null) return "";
        String[] _times = shortStyle.split("-");
        if (_times.length != 2) {
            return shortStyle;
        }
        return _times[0] + "&nbsp;年&nbsp;" + _times[1] + "&nbsp;月";

    }

    public static String numberFormatToCNStyle(String shortStyle) {
        if (shortStyle == null) return "";
        String[] _times = shortStyle.split("-");

        if (_times.length == 2) {
            return "<u>&nbsp;" + _times[0] + "&nbsp;</u>（区号）" +
                    "<u>&nbsp;" + _times[1] + "&nbsp;</u>";
        }
        if (_times.length == 3) {
            return "<u>&nbsp;" + _times[0] + "&nbsp;</u>（区号）" +
                    "<u>&nbsp;" + _times[1] + "&nbsp;</u>（总机）" +
                    "<u>&nbsp;" + _times[2] + "&nbsp;</u>（分机）";
        }
        return shortStyle;

    }
}

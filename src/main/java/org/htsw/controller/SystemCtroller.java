package org.htsw.controller;

import com.jfinal.core.Controller;
import org.htsw.util.StaticFactory;

/**
 * ͳһ�̳еĺ�̨Controller
 * Created by snowfigure on 2015/4/11.
 */
public class SystemCtroller extends Controller {
    @Override
    public void render(String view) {
        setAttr("ctx", getRequest().getContextPath());
        setAttr("systemConfig", StaticFactory.getSystemConfigMap());
        super.render(view);
    }
}

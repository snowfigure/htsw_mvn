package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.Article;

@Before(ManagerInterceptor.class)
public class AdminPageArticleController extends AdminController {
    public void index() {
        setAttr("aid", getPara("aid", "-1"));
        render("/WEB-INF/ADMIN_PAGE/ARTICLE/article.ftl");
    }

    public void edit() {
        String editType = getPara("type", "");
        int aid = getParaToInt("aid", -1);
        if ("".equals(editType.trim()) || null == editType || aid == -1) {
            renderText("出错，需要转404页面");
            return;
        }


        if ("load".equals(editType.trim().toLowerCase())) {
            renderJson(Article.me.findById(aid));
        } else {
            String content = getPara("content");
            boolean flag = Article.me.findById(aid).set("content", content).update();
            renderJson(flag);
        }
    }

}

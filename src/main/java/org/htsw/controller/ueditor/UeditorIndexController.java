package org.htsw.controller.ueditor;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * Ueditor
 * Created by snowfigure on 2015/4/22.
 */
public class UeditorIndexController extends Controller {
    public void upload() {
        renderJsp("/assets/ueditor/jsp/controller.jsp");
    }

    @ActionKey("/assets/ueditor/dialogs/anchor/anchor")
    public void anchor() {
        renderJsp("/assets/ueditor/dialogs/anchor/anchor.html");
    }

    @ActionKey("/assets/ueditor/dialogs/image/image")
    public void image() {
        renderJsp("/assets/ueditor/dialogs/image/image.html");
    }


    @ActionKey("/assets/ueditor/dialogs/help/help")
    public void help() {
        renderJsp("/assets/ueditor/dialogs/help/help.html");
    }

    @ActionKey("/assets/ueditor/dialogs/link/link")
    public void link() {
        renderJsp("/assets/ueditor/dialogs/link/link.html");
    }

    @ActionKey("/assets/ueditor/dialogs/spechars/spechars")
    public void spechars() {
        renderJsp("/assets/ueditor/dialogs/spechars/spechars.html");
    }

    @ActionKey("/assets/ueditor/dialogs/searchreplace/searchreplace")
    public void searchreplace() {
        renderJsp("/assets/ueditor/dialogs/searchreplace/searchreplace.html");
    }

    @ActionKey("/assets/ueditor/dialogs/map/map")
    public void map() {
        renderJsp("/assets/ueditor/dialogs/map/map.html");
    }

    @ActionKey("/assets/ueditor/dialogs/gmap/gmap")
    public void gmap() {
        renderJsp("/assets/ueditor/dialogs/gmap/gmap.html");
    }

    @ActionKey("/assets/ueditor/dialogs/video/video")
    public void video() {
        renderJsp("/assets/ueditor/dialogs/video/video.html");
    }

    @ActionKey("/assets/ueditor/dialogs/preview/preview")
    public void preview() {
        renderJsp("/assets/ueditor/dialogs/preview/preview.html");
    }


    @ActionKey("/assets/ueditor/dialogs/emotion/emotion")
    public void emotion() {
        renderJsp("/assets/ueditor/dialogs/emotion/emotion.html");
    }

    @ActionKey("/assets/ueditor/dialogs/wordimage/wordimage")
    public void wordimage() {
        renderJsp("/assets/ueditor/dialogs/wordimage/wordimage.html");
    }

    @ActionKey("/assets/ueditor/dialogs/attachment/attachment")
    public void attachment() {
        renderJsp("/assets/ueditor/dialogs/attachment/attachment.html");
    }

    @ActionKey("/assets/ueditor/dialogs/insertframe/insertframe")
    public void insertframe() {
        renderJsp("/assets/ueditor/dialogs/insertframe/insertframe.html");
    }


    @ActionKey("/assets/ueditor/dialogs/table/edittip")
    public void edittip() {
        renderJsp("/assets/ueditor/dialogs/table/edittip.html");
    }

    @ActionKey("/assets/ueditor/dialogs/table/edittable")
    public void edittable() {
        renderJsp("/assets/ueditor/dialogs/table/edittable.html");
    }

    @ActionKey("/assets/ueditor/dialogs/table/edittd")
    public void edittd() {
        renderJsp("/assets/ueditor/dialogs/table/edittd.html");
    }

    @ActionKey("/assets/ueditor/dialogs/webapp/webapp")
    public void webapp() {
        renderJsp("/assets/ueditor/dialogs/webapp/webapp.html");
    }

    @ActionKey("/assets/ueditor/dialogs/snapscreen/snapscreen")
    public void snapscreen() {
        renderJsp("/assets/ueditor/dialogs/snapscreen/snapscreen.html");
    }

    @ActionKey("/assets/ueditor/dialogs/scrawl/scrawl")
    public void scrawl() {
        renderJsp("/assets/ueditor/dialogs/scrawl/scrawl.html");
    }

    @ActionKey("/assets/ueditor/dialogs/music/music")
    public void music() {
        renderJsp("/assets/ueditor/dialogs/music/music.html");
    }

    @ActionKey("/assets/ueditor/dialogs/template/template")
    public void template() {
        renderJsp("/assets/ueditor/dialogs/template/template.html");
    }

    @ActionKey("/assets/ueditor/dialogs/background/background")
    public void background() {
        renderJsp("/assets/ueditor/dialogs/background/background.html");
    }

    @ActionKey("/assets/ueditor/dialogs/charts/charts")
    public void charts() {
        renderJsp("/assets/ueditor/dialogs/charts/charts.html");
    }
}

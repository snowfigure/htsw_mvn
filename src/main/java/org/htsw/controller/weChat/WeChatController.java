//package org.htsw.controller.weChat;
//
//import com.github.sd4324530.fastweixin.message.BaseMsg;
//import com.github.sd4324530.fastweixin.message.TextMsg;
//import com.github.sd4324530.fastweixin.message.req.ImageReqMsg;
//import com.github.sd4324530.fastweixin.message.req.MenuEvent;
//import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
//import com.github.sd4324530.fastweixin.servlet.WeixinControllerSupport;
//import com.github.sd4324530.fastweixin.servlet.WeixinSupport;
//import com.jfinal.core.Controller;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import javax.servlet.http.HttpServletRequest;
//
///**
// * Created by lisa-zlx on 2015/6/23.
// */
//public class WeChatController extends Controller {
//    private static final Logger log  = LoggerFactory.getLogger(WeChatController.class);
//    //用户自行实现的消息处理器
//    private WeixinSupport support = new WeixinControllerSupport() {
//        //设置TOKEN，用于绑定微信服务器
//        @Override
//        protected String getToken() {
//            return "snowfigure";
//        }
//        //重写父类方法，处理对应的微信消息
//        @Override
//        protected BaseMsg handleTextMsg(TextReqMsg msg) {
//            String content = msg.getContent();
//            System.out.println("用户发送到服务器的内容:"+ content);
//            return new TextMsg("服务器回复用户消息!:" + content);
//        }
//
//
//        //重写父类方法，处理对应的图片消息
//        protected BaseMsg handleImageMsg(ImageReqMsg msg) {
//            System.out.println(msg.getPicUrl());
//            return new TextMsg("服务器回复用户消息!:" + msg.getPicUrl());
//        }
//        //重写父类方法，处理 菜单点击事件
//        protected BaseMsg handleMenuClickEvent(MenuEvent event) {
//            System.out.println(event.toString());
//            return handleDefaultEvent(event);
//        }
//        //重写父类方法，处理 菜单跳转事件
//        protected BaseMsg handleMenuViewEvent(MenuEvent event) {
//            System.out.println(event.toString());
//            return handleDefaultEvent(event);
//        }
//
//        /*1.1版本新增，重写父类方法，加入自定义微信消息处理器
//         *不是必须的，上面的方法是统一处理所有的文本消息，如果业务觉复杂，上面的会显得比较乱
//         *这个机制就是为了应对这种情况，每个MessageHandle就是一个业务，只处理指定的那部分消息
//         */
////        @Override
////        protected List<MessageHandle> initMessageHandles() {
////            List<MessageHandle> handles = new ArrayList<MessageHandle>();
////            handles.add(new MyMessageHandle());
////            return handles;
////        }
////        //1.1版本新增，重写父类方法，加入自定义微信事件处理器，同上
////        @Override
////        protected List<EventHandle> initEventHandles() {
////            List<EventHandle> handles = new ArrayList<EventHandle>();
////            handles.add(new MyEventHandle());
////            return handles;
////        }
//    };
//    public void index() {
//        HttpServletRequest request = getRequest();
////        System.out.println("method:"+ request.getMethod());
//        //绑定微信服务器
//        if ("GET".equalsIgnoreCase(request.getMethod().toUpperCase())) {
//            support.bindServer(request, getResponse());
//            renderNull();
//        } else {
//            //处理消息
////            System.out.println(request.getQueryString());
//            renderText(support.processRequest(request), "text/xml");
//        }
//    }
//}
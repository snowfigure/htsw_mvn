package org.htsw.controller.weChat;

import com.github.sd4324530.fastweixin.message.BaseMsg;
import com.github.sd4324530.fastweixin.message.TextMsg;
import com.github.sd4324530.fastweixin.message.req.TextReqMsg;
import com.github.sd4324530.fastweixin.servlet.WeixinSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by lisa-zlx on 2015/6/23.
 */
public class JFinalWeixinSupport extends WeixinSupport {
    private static final Logger log  = LoggerFactory.getLogger(JFinalWeixinSupport.class);
    //����TOKEN�����ڰ�΢�ŷ�����
    @Override
    protected String getToken() {
        return "snowfigure";
    }
    //ʹ�ð�ȫģʽʱ���ã�APPID
    //����ǿ����д���м�����Ҫʱ������д�÷���
    @Override
    protected String getAppId() {
        return "wx4c7b64a1590fa859";
    }
    //ʹ�ð�ȫģʽʱ���ã���Կ
    //����ǿ����д���м�����Ҫʱ������д�÷���
    @Override
    protected String getAESKey() {
        return "W8mm3NnZpygi3UmWuntsVfu3B4hJWa0XoK73FvoFIlh";
    }
    //��д���෽���������Ӧ��΢����Ϣ
    @Override
    protected BaseMsg handleTextMsg(TextReqMsg msg) {
        String content = msg.getContent();
        log.debug("�û����͵�������������:{}", content);
        return new TextMsg("�������ظ��û���Ϣ!");
    }
        /*1.1�汾��������д���෽���������Զ���΢����Ϣ������
         *���Ǳ���ģ�����ķ�����ͳһ�������е��ı���Ϣ�����ҵ������ӣ�����Ļ��ԵñȽ���
         *������ƾ���Ϊ��Ӧ�����������ÿ��MessageHandle����һ��ҵ��ֻ����ָ�����ǲ�����Ϣ
         */
//        @Override
//        protected List<MessageHandle> initMessageHandles() {
//            List<MessageHandle> handles = new ArrayList<MessageHandle>();
//            handles.add(new MyMessageHandle());
//            return handles;
//        }
//        //1.1�汾��������д���෽���������Զ���΢���¼���������ͬ��
//        @Override
//        protected List<EventHandle> initEventHandles() {
//            List<EventHandle> handles = new ArrayList<EventHandle>();
//            handles.add(new MyEventHandle());
//            return handles;
//        }
}

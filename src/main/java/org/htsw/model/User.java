package org.htsw.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.MD5;

/**
 * �û�
 *
 * @author SnowFigure {Orgin:�L�Ӄ�}
 * @date 2014��11��29�� ����10:54:28
 */
public class User extends Model<User> {

    public static final User dao = new User();
    public static final String TABLE_NAME = "user";
    public static final String ID = "id";
    public static final String USERNAME = "username"; // ��¼�˺�
    public static final String PASSWORD = "password"; // ��¼����
    public static final String NICKNAME = "nickname"; // �ǳ�
    public static final String NAME = "name"; // ����
    public static final String SEX = "sex"; // �Ա� Ĭ�ϣ�0���У� Ů��1
    public static final String BIRTHDAY = "birthday"; // ����
    public static final String HEAD_PHOTO_PATH = "head_photo_path"; // ͷ��
    public static final String SIGNATURE = "signature"; // ����ǩ��
    public static final String WEBSITE = "website"; // ������վ
    public static final String TYPE = "type"; // �û����� Ĭ�ϣ�0����ͨ�û��� ����Ա��1
    public static final String LOGIN_STATUS = "login_status"; // �Ƿ��¼״̬ Ĭ�ϣ�0
    // ���ߣ�1
    public static final String CREATE_TIME = "create_time"; // ����ʱ��
    public static final String UPDATE_TIME = "update_time"; // ����ʱ��
    public static final String LAST_LOGIN_TIME = "last_login_time"; // ����¼ʱ��
    public static final String LAST_LOGIN_IP = "last_login_ip"; // ����¼IP
    public static final String DELETE_STATUS = "delete_status"; // ɾ��״̬ Ĭ�ϣ�0
    // ɾ����1
    public static final String ENABLE = "enable"; // �Ƿ�ͣ�� Ĭ�ϣ�0 ͣ�ã�1
    private static final long serialVersionUID = 3412441464329317748L;

    /**
     * ����user������ҳ����user�û�
     *
     * @param pageNumber ��ǰҳ
     * @param pageSize   ÿҳ��ʾ����
     * @param user       ����
     * @return Page<User>
     */
    public Page<User> searchPaginate(int pageNumber, int pageSize, User user) {
        String select = "SELECT * ";
        StringBuffer stringBuffer = new StringBuffer("FROM user WHERE delete_status = '0' ");
        // �ж��û����Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(USERNAME) && !"".equals(user.getStr(USERNAME))) {
            stringBuffer.append("AND ").append(USERNAME).append(" like '").append(user.getStr(USERNAME)).append("%' "); // �û������ģ������
        }
        // �ж������Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(NAME) && !"".equals(user.getStr(NAME))) {
            stringBuffer.append("AND ").append(NAME).append(" like '").append(user.getStr(NAME)).append("%' "); // �������ģ������
        }
        // �ж��Ա��Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(SEX) && !"".equals(user.getStr(SEX))) {
            stringBuffer.append("AND ").append(SEX).append(" = '").append(user.getStr(SEX)).append("' ");
        }
        // �ж��û������Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(TYPE) && !"".equals(user.getStr(TYPE))) {
            stringBuffer.append("AND ").append(TYPE).append(" = '").append(user.getStr(TYPE)).append("' ");
        }
        // �ж�����״̬�Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(LOGIN_STATUS) && !"".equals(user.getStr(LOGIN_STATUS))) {
            stringBuffer.append("AND ").append(LOGIN_STATUS).append(" = '").append(user.getStr(LOGIN_STATUS)).append("' ");
        }
        // �ж�����״̬�Ƿ�Ϊ�գ���Ϊ���������
        if (null != user.getStr(ENABLE) && !"".equals(user.getStr(ENABLE))) {
            stringBuffer.append("AND ").append(ENABLE).append(" = '").append(user.getStr(ENABLE)).append("' ");
        }

        stringBuffer.append("ORDER BY id DESC");

        return paginate(pageNumber, pageSize, select, stringBuffer.toString());
    }

    /**
     * ����username�����û�
     *
     * @param username �û���
     * @return User
     */
    public User searchByUsername(String username) {
        String sql = "SELECT * FROM user WHERE delete_status = '0' AND username = ?";
        return findFirst(sql, username);
    }

    /**
     * ����ids����ɾ���û���ʵ�ʣ�����delete_status = '1'��
     *
     * @param ids
     * @return boolean
     */
    public boolean deleteByIds(String[] ids) {
        StringBuffer stringBuffer = new StringBuffer("UPDATE user SET delete_status = '1',enable = '1' WHERE ");
        if (null != ids && 1 == ids.length) {
            stringBuffer.append("id = ?");
            return 0 == Db.update(stringBuffer.toString(), ids[0]) ? true : false;
        } else if (null != ids && ids.length > 1) {
            stringBuffer.append("id in('");
            for (String id : ids) {
                stringBuffer.append(id).append("','");
            }
            stringBuffer.delete(stringBuffer.length() - 2, stringBuffer.length()); // ȥ�����һ��,��'
            stringBuffer.append(")");
            return 0 == Db.update(stringBuffer.toString()) ? true : false;
        }

        return false;
    }

    /**
     * ����ids���������û�����
     *
     * @param ids
     * @return boolean
     */
    public boolean resetPasswords(String[] ids) {
        StringBuffer stringBuffer = new StringBuffer("UPDATE user SET password = ? WHERE ");
        if (null != ids && 1 == ids.length) {
            stringBuffer.append("id = ?");
            return 0 == Db.update(stringBuffer.toString(), MD5.getMD5ofStr("000000"), ids[0]) ? true : false;
        } else if (null != ids && ids.length > 1) {
            stringBuffer.append("id in('");
            for (String id : ids) {
                stringBuffer.append(id).append("','");
            }
            stringBuffer.delete(stringBuffer.length() - 2, stringBuffer.length()); // ȥ�����һ��,��'
            stringBuffer.append(")");
            return 0 == Db.update(stringBuffer.toString(), MD5.getMD5ofStr("000000")) ? true : false;
        }

        return false;
    }
}

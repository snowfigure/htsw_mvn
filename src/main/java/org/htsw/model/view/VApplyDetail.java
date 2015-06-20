package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import org.apache.commons.lang.StringUtils;


/**
 * 用户申请信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VApplyDetail extends Model<VApplyDetail> {
    public static final VApplyDetail me = new VApplyDetail();


    public Page<VApplyDetail> paginate(int pageNumber, int pageSize , int status ,
                                       String apply_user_name,String deal_user_name,
                                       String start_time,String end_time
    ){

        String search = "";
        if(!StringUtils.isEmpty(start_time) && !StringUtils.isEmpty(end_time) ){
            start_time += " 00:00:00";
            end_time += " 23:59:59";
            search += String.format( " and  apply_time between '%s' and '%s' " , start_time, end_time) ;
        }

        if(!StringUtils.isEmpty(apply_user_name)){
            search += String.format( " and  apply_user_name like '%s' " , "%" +apply_user_name + "%") ;
        }

        if(!StringUtils.isEmpty(deal_user_name)){
            search += String.format( " and  deal_user_name like '%s' " , "%" +deal_user_name + "%") ;
        }

        System.out.println("from v_apply_detail where 'status' =  " + status + search );
        if(status==0 )
        {
            if(StringUtils.isEmpty(search)){
                return paginate(pageNumber,pageSize,
                        "select * ",
                        "from v_apply_detail" );
            }else{
                return paginate(pageNumber,pageSize,
                        "select * ",
                        "from v_apply_detail where 1=1 " + search);
            }
        }
        else
        {
            return paginate(pageNumber,pageSize,
                    "select * ",
                    "from v_apply_detail where 'status' =?  " + search,status);
        }

    }
}

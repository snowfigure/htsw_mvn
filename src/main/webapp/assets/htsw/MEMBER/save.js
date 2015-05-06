/**
 * 保存按钮处理
 * Created by snowfigure on 2015/5/6.
 */

$(document).ready(function(){
    function saveBind(save_btn_id,form_id,_url)
    {
        $("[id='"+save_btn_id+"']").bind({
            'click':function(){
                var values =  ($("[id='"+form_id+"']"))[0];
                var map = {};
                for(var idx=0 ; idx<values.length; idx ++)
                {
                    //console.log(values[idx].id + "  " + values[idx].type + "   " + values[idx].value );
                    if(values[idx].type == "select-one")
                    {
                        map[values[idx].id] = values[idx].selectedIndex;
                        continue;
                    }

                    if(values[idx].type == "text")
                    {
                        map[values[idx].id] = values[idx].value;
                        continue;
                    }
                    map[values[idx].id] = values[idx].value;

                }
                console.log(map);

                $.ajax({
                    type: 'POST',
                    url: _url,
                    data:map,
                    success: function (data){

                    }
                });

            }
        });
    }
    saveBind("user_Info_save","user_Info_form","/member/userEdit/userInfo");
    saveBind("user_House_save","user_House_form","/member/userEdit/userHouseCar");
    saveBind("user_Bank_save","user_Bank_form","/member/userEdit/userBank");


});

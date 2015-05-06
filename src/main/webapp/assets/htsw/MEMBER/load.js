/**
 * 所有Select组件的预加载处理
 * Created by snowfigure on 2015/5/1.
 */

$(document).ready(function(){
    /**
     * 页面内Select加载公共组件
     * @param id
     * @param _url
     */
    function comboboxLoad(id,_url)
    {
        $.ajax({
            type: 'POST',
            url: _url,
            success: function (data){
                //$('#' + id).html('');
               var html = "<option value='-1'> - </option>";
               for(var i=0;i<data.length;i++)
               {
                   html += "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
               }
                $("[id='"+id+"']").html(html)
            }
        });
    }
    //加载婚姻状况
    comboboxLoad("user_Info.marry_status_id","/load/MarryStatusJSON");
    //加载学历分类
    comboboxLoad("user_Info.degree_id","/load/DegreeTypeJSON");
    //房产类型
    comboboxLoad("user_House.type_id","/load/HouseTypeJSON");






    //省市县三级联动
    function  chinaAreaLoad(pid,cid,tid)
    {
        comboboxLoad(pid,"/load/ProvenceJSON");
        $("[id='"+pid+"']").bind({
            'change':function(){
                var _pid = $("[id='"+pid+"']").val();
                comboboxLoad(cid,"/load/CityJSON/" + _pid);
                $("[id='"+tid+"']").html("<option value='-1'> - </option>");

                $("[id='"+cid+"']").bind({
                    'change':function(){
                        var _cid = $("[id='"+cid+"']").val();
                        comboboxLoad(tid,"/load/TownJSON/" + _cid);
                    }
                });
            }
        });
    }
    chinaAreaLoad("user_Info.huji_provence","user_Info.huji_city","user_Info.huji_town");
    chinaAreaLoad("user_Info.address_provence","user_Info.address_city","user_Info.address_town");
    chinaAreaLoad("user_House.address_provence","user_House.address_city","user_House.address_town");

});

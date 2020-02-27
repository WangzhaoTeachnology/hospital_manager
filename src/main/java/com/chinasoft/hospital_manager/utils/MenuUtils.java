package com.chinasoft.hospital_manager.utils;

import com.chinasoft.hospital_manager.domain.Menu;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jack on 2019/12/23 15:28
 */
public class MenuUtils {


    /**
     * @description:筛序出一级菜单
     * @author jack
     * @date 2019/12/23 15:54
     * @param null
     * @return
     */

   public   static  List<Menu>  getTop(List<Menu> menus){
       List<Menu> list=new ArrayList<Menu>();
       if (menus!=null){
           for (Menu menu:menus){
               if (menu.getParentid()==0){
                   list.add(menu);
               }
           }
       }
       return list;
   }

   /**
    * @description:筛序出二级菜单
    * @author jack
    * @date 2019/12/23 15:55
    * @param null
    * @return
    */

   public static List<Menu> getSecond(List<Menu> menus,List<Menu> topMenu){
       List<Menu> list=new ArrayList<Menu>();
       if (menus!=null){
           for (Menu menu:menus){
               for (Menu menu1:topMenu){
                   if (menu.getParentid()==menu1.getMenuid()){
                       list.add(menu);
                       break;//因为这个一级菜单作为内层的for循环，所以只要找到一个就直接break，让外层的for循环再次遍历
                   }
               }
           }
       }
       return list;
   }


   /**
    * @description:这个是登录成功后点击不同的二级菜单，利用二级菜单的id，去查询这个二级菜单下面的三级菜单，是否显示是增删改的权限
    * @author jack
    * @date 2020/1/18 15:34
    * @param null
    * @return
    */

   public  static List<Menu> getThird(List<Menu> menus,int secondMenudId){
       List<Menu> list=new ArrayList<Menu>();
       if (menus!=null){
           for (Menu menu:menus){
                if (menu.getParentid()==secondMenudId){
                    list.add(menu);
                }
           }
           return list;
       }
       return null;
   }
}

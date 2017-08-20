package com.zedata.foodsafety.util;

import java.beans.BeanInfo;  
import java.beans.Introspector;  
import java.beans.PropertyDescriptor;  
import java.lang.reflect.Method;  
import java.util.HashMap;  
import java.util.Map;   
  
import org.apache.commons.beanutils.BeanUtils;  
/**
 * @类名:BeanUtilTest.java 
 * @全路径包名： com.zedata.foodsafety.util.BeanUtilTest.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @联系方式：QQ173764520
 * @日期： 2017年7月2日 下午11:31:53 
 * @版本： V1.0   
 */
public class BeanUtil {
	/**
	 * Map --> Bean 2: 利用org.apache.commons.beanutils 工具类实现 Map --> Bean  
	 * @param map
	 * @param obj
	 */
    public static void transMap2Bean2(Map<String, Object> map, Object obj) {  
        if (map == null || obj == null) {  
            return;  
        }  
        try {  
            BeanUtils.populate(obj, map);  
        } catch (Exception e) {  
            System.out.println("transMap2Bean2 Error " + e);  
        }  
    }  
  
    /**
     *  Map --> Bean 1: 利用Introspector,PropertyDescriptor实现 Map --> Bean  
     * @param map
     * @param obj
     */
    public static void transMap2Bean(Map<String, Object> map, Object obj) {  
  
        try {  
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());  
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
  
            for (PropertyDescriptor property : propertyDescriptors) {  
                String key = property.getName();  
  
                if (map.containsKey(key)) {  
                    Object value = map.get(key);  
                    // 得到property对应的setter方法  
                    Method setter = property.getWriteMethod();  
                    setter.invoke(obj, value);  
                }  
  
            }  
  
        } catch (Exception e) {  
            System.out.println("transMap2Bean Error " + e);  
        }  
  
        return;  
  
    }  
  
    /**
     * Bean --> Map 1: 利用Introspector和PropertyDescriptor 将Bean --> Map  
     * @param obj
     * @return
     */
    public static Map<String, Object> transBean2Map(Object obj) {  
  
        if(obj == null){  
            return null;  
        }          
        Map<String, Object> map = new HashMap<String, Object>();  
        try {  
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());  
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
            for (PropertyDescriptor property : propertyDescriptors) {  
                String key = property.getName();  
  
                // 过滤class属性  
                if (!key.equals("class")) {  
                    // 得到property对应的getter方法  
                    Method getter = property.getReadMethod();  
                    Object value = getter.invoke(obj);  
  
                    map.put(key, value);  
                }  
  
            }  
        } catch (Exception e) {  
            System.out.println("transBean2Map Error " + e);  
        }  
  
        return map;  
  
    }  
}

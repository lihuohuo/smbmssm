package cn.happy.test;



import cn.happy.Spring10MethodAop.ISomeService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * Created by lenovo on 2017/7/24.
 */
public class Spring10Aop {

   @Test
    public void Aop09(){


       ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext10MethodAop.xml");
       ISomeService service = (ISomeService) ctx.getBean("someProxy");
        service.say1();
       String s = service.say2();
       System.out.println(s);
       service.say3();

   }

}

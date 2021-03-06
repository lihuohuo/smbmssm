package cn.happy.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * Created by lenovo on 2017/7/4.
 */
public class MyBatisUtil {
    public static SqlSessionFactory getSqlSessionFactory() {
        String path = "MyBatis-config.xml";
        InputStream is = MyBatisUtil.class.getClassLoader()
                .getResourceAsStream(path);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        return factory;
    }

    /**
     * 获取SqlSession
     *
     * @return SqlSession
     */
    public static SqlSession getSqlSession() {
        return getSqlSessionFactory().openSession();
    }

    /**
     * 获取SqlSession
     *
     * @param isAutoCommit true 表示创建的SqlSession对象在执行完SQL之后会自动提交事务 false
     *                     表示创建的SqlSession对象在执行完SQL之后不会自动提交事务
     *                     ，这时就需要我们手动调用sqlSession.commit()提交事务
     * @return SqlSession
     */
    public static SqlSession getSqlSession(boolean isAutoCommit) {
        return getSqlSessionFactory().openSession(isAutoCommit);
    }
}
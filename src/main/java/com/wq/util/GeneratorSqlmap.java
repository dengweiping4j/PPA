package com.wq.util;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 */
public class GeneratorSqlmap {
    public void generator() throws Exception{
        List<String> warnings = new ArrayList<>();
        boolean overwrite = true;
        //指定逆向工程配置文件
        File configFile = new File("/Users/dengweiping/Documents/PPA/src/main/resources/generatorConfig.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
                callback, warnings);
        myBatisGenerator.generate(null);
    }
//    public static void main(String[] args) throws Exception {
//        try {
//            GeneratorSqlmap generatorSqlmap = new GeneratorSqlmap();
//            generatorSqlmap.generator();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }

}


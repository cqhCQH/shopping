package cn.edu.jxufe.controller;

import com.aliyun.oss.OSSClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by 程 on 2018/8/14.
 */
@Controller
public class uploadController {
    @RequestMapping("uploadfile")
    @ResponseBody
   public Object uploadFile(MultipartFile file){
       System.out.println("上传的文件名是"+file.getOriginalFilename());
       String endpoint="http://oss-cn-beijing.aliyuncs.com";
       String accessKeyId="LTAIfus9DUz6ACWS";
       String accessKeySecret= "rx1Kz1LhAieN6bKkoPOvzXiruHu8GQ";
       String buckName="chengquhong";
       OSSClient ossClient=new OSSClient(endpoint,accessKeyId,accessKeySecret);
       try {
           InputStream inputStream=file.getInputStream();
           ossClient.putObject(buckName,file.getOriginalFilename(),inputStream);
       } catch (IOException e) {
           e.printStackTrace();
       }finally {
           ossClient.shutdown();
       }
       return endpoint.replace("http://","http://"+buckName+".")+"/"+file.getOriginalFilename();
   }
}

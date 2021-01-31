package com.kgc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

@Controller
public class UploadController {
    @Autowired
    private ServletContext servletContext;

    @RequestMapping("upload")
    @ResponseBody
    public Map upload(MultipartFile file ) throws Exception{

        String path=servletContext.getRealPath("upload");//oos
        File dir=new File(path);
        if(!dir.exists())dir.mkdir();
//        String fileName=getFileName(file.getOriginalFilename());
        String fileName=file.getOriginalFilename();
        String str=path+"/"+fileName;//上传文件的原始名称
        file.transferTo(new File(str));

        Map map=new HashMap();
        map.put("msg","文件上传成功!");
        map.put("path",fileName);
        return map;
    }

    //随机生一个新的文件名+老的文件名的缀
    private String getFileName(String fileName){
        String extName=fileName.substring(fileName.lastIndexOf("."));
        return UUID.randomUUID()+""+new Random().nextInt(1000)+extName;
    }
}

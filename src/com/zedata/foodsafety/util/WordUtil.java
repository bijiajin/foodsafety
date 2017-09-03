package com.zedata.foodsafety.util;

import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;  
import org.apache.poi.xwpf.usermodel.*;  
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;  
  
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.List; 

/**
 * @类名:WordUtil.java 
 * @全路径包名： com.zedata.foodsafety.util.WordUtil.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @联系方式：QQ173764520
 * @日期： 2017年9月3日 下午5:56:30 
 * @版本： V1.0   
 */
public class WordUtil {
	
	public static String createReport(List<PageData> dataSource,String uploadPath) throws IOException{
		String restPath = File.separator+DateUtil.getAllTime()+"统计报告.docx";
		String path = uploadPath+restPath;
		
		//Blank Document  
        XWPFDocument document= new XWPFDocument();  
  
        //Write the Document in file system  
        File file = new File(path);
        FileOutputStream out = new FileOutputStream(file);  
  
  
        //添加标题  
        XWPFParagraph titleParagraph = document.createParagraph();  
        //设置段落居中  
        titleParagraph.setAlignment(ParagraphAlignment.CENTER);  
  
        XWPFRun titleParagraphRun = titleParagraph.createRun();  
        titleParagraphRun.setText("统计报表");  
        titleParagraphRun.setColor("000000");  
        titleParagraphRun.setFontSize(20);  
        for(int i=0 ;i<dataSource.size();i++){
        	PageData pd =  dataSource.get(i);
        	/**
        	 * 标题段落
        	 */
            XWPFParagraph firstParagraph = document.createParagraph();  
            XWPFRun run = firstParagraph.createRun();  
            run.setText("标题:"+pd.getString("title"));  
            run.setColor("000000");  
            run.setFontSize(16);  
      
            //设置段落背景颜色  
            CTShd cTShd = run.getCTR().addNewRPr().addNewShd();  
            cTShd.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph1 = document.createParagraph();  
            XWPFRun paragraphRun1 = paragraph1.createRun();  
            paragraphRun1.setText("\r"); 
            
            /**
             * 来源段落
             */
            XWPFParagraph firstParagraph1 = document.createParagraph();  
            XWPFRun run1 = firstParagraph1.createRun();  
            run1.setText("来源:"+pd.getString("source"));  
            run1.setColor("000000");  
            run1.setFontSize(16);  
      
            //设置段落背景颜色  
            CTShd cTShd1 = run1.getCTR().addNewRPr().addNewShd();  
            cTShd1.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph11 = document.createParagraph();  
            XWPFRun paragraphRun11 = paragraph11.createRun();  
            paragraphRun11.setText("\r"); 
            
            /**
             * 链接
             */
            XWPFParagraph firstParagraph2 = document.createParagraph();  
            XWPFRun run2 = firstParagraph2.createRun();  
            run2.setText("链接:"+pd.getString("link"));  
            run2.setColor("000000");  
            run2.setFontSize(16);  
      
            //设置段落背景颜色  
            CTShd cTShd2 = run2.getCTR().addNewRPr().addNewShd();  
            cTShd2.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph12 = document.createParagraph();  
            XWPFRun paragraphRun12 = paragraph12.createRun();  
            paragraphRun12.setText("\r"); 
            
            /**
             * 简介段落
             */
            XWPFParagraph firstParagraph3 = document.createParagraph();  
            XWPFRun run3 = firstParagraph3.createRun();  
            run3.setText("简介:");  
            run3.setColor("000000");  
            run3.setFontSize(16);  
      
            //设置段落背景颜色  
            CTShd cTShd3 = run3.getCTR().addNewRPr().addNewShd();  
            cTShd3.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph13 = document.createParagraph();  
            XWPFRun paragraphRun13 = paragraph13.createRun();  
            paragraphRun13.setText("\r"); 
            
            //实际内容
            XWPFParagraph firstParagraph6 = document.createParagraph();  
            XWPFRun run6 = firstParagraph6.createRun();  
            run6.setText(pd.getString("summary"));  
            run6.setColor("000000");  
            run6.setFontSize(14);  
      
            //设置段落背景颜色  
            CTShd cTShd6 = run6.getCTR().addNewRPr().addNewShd();  
            cTShd6.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph16 = document.createParagraph();  
            XWPFRun paragraphRun16 = paragraph13.createRun();  
            paragraphRun16.setText("\r"); 
            
            /**
             * 内容
             */
            XWPFParagraph firstParagraph4 = document.createParagraph();  
            XWPFRun run4 = firstParagraph4.createRun();  
            run4.setText("内容:");  
            run4.setColor("000000");  
            run4.setFontSize(16);  
      
            //设置段落背景颜色  
            CTShd cTShd4 = run4.getCTR().addNewRPr().addNewShd();  
            cTShd4.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph14 = document.createParagraph();  
            XWPFRun paragraphRun14 = paragraph14.createRun();  
            paragraphRun14.setText("\r"); 
            
            //实际内容
            XWPFParagraph firstParagraph5 = document.createParagraph();  
            XWPFRun run5 = firstParagraph5.createRun();  
            run5.setText(pd.getString("summary"));  
            run5.setColor("000000");  
            run5.setFontSize(14);  
      
            //设置段落背景颜色  
            CTShd cTShd5 = run5.getCTR().addNewRPr().addNewShd();  
            cTShd4.setVal(STShd.CLEAR);  
           
      
            //换行  
            XWPFParagraph paragraph15 = document.createParagraph();  
            XWPFRun paragraphRun15 = paragraph15.createRun();  
            paragraphRun15.setText("\r"); 
            
            
        	
        }
        
  
  
        document.write(out);  
        out.close();  
		return File.separator+"foodsafety"+File.separator+"report"+restPath;
	}

}

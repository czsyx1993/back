package com.yinhai.common.common.util;

import com.alibaba.fastjson.JSONObject;
import com.yinhai.ta404.core.utils.ValidateUtil;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

public  class FileManageUtil {
    private static String ucm_up_url = "/ucm/ucmAction!postFile.do";    //上传地址
    private static String ucm_down_url = "/ucm/ucmAction!getFile.do";   //下载地址
    private static String address;  //总控地址
    private static String address_up = "/ucmRestServcie/getUploadUrl.do";   //总控地址上传寻址接口
    private static String address_down = "/ucmRestServcie/getDownloadUrl.do";   //总控地址下载寻址接口
    private static String addrcode; //区域代码
    private static String sysid;    //接入系统id
    private static String isexternal;   //0：内网寻址  1：外网寻址
    private static String busitype; //文件类型

    private static String aab301;
    private static String yab003;
    private static String loginid;

    static {
        ResourceBundle p =null;
        try {
            p = ResourceBundle.getBundle("paramConfig");
        } catch (Exception e) {
            e.printStackTrace();
        }

        address = p.getString("cloudStore_Address");
        addrcode = p.getString("cloudStore_Addrcode");
        sysid = p.getString("cloudStore_Sysid");
        isexternal = p.getString("cloudStore_Isexternal");
        busitype = p.getString("cloudStore_Busitype");
        aab301 = p.getString("cloudStore_Aab301");
        yab003 = p.getString("cloudStore_Yab003");
        loginid = p.getString("cloudStore_Loginid");

    }

    public static void main(String[] args) {
        try {
            fileUpload("scjy.sql",new byte[]{1,2,3,4});
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 文件上传
     * @param filename 文件名
     * @param bytes 字节数组
     * @return 文件id
     * @throws Exception 异常
     */
    public static String fileUpload(String filename, byte[] bytes) throws Exception {
        String fileId = "";
        Map<String, Object> textMap = new HashMap<String, Object>();
        //可以设置多个input的name，value
        textMap.put("sysid", sysid);
        textMap.put("aab301", aab301);
        textMap.put("yab003", yab003);
        textMap.put("loginid", loginid);
        textMap.put("addrcode", addrcode);
        textMap.put("busitype", busitype);

        String res = "";
        HttpURLConnection conn = null;
        String boundary = "9431149156168";

        try {
            URL url = new URL(getUploadUrl());
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(30000);
            conn.setReadTimeout(120000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent",
                    "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type",
                    "multipart/form-data; boundary=" + boundary);
            OutputStream out = new DataOutputStream(conn.getOutputStream());

            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator iter = textMap.entrySet().iterator();
                int i = 0;

                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();

                    if (inputValue == null) {
                        continue;
                    }

                    if (i == 0) {
                        strBuf.append("--").append(boundary).append("\r\n");
                        strBuf.append("Content-Disposition: form-data; name=\""
                                + inputName + "\"\r\n\r\n");
                        strBuf.append(inputValue);
                    } else {
                        strBuf.append("\r\n").append("--").append(boundary)
                                .append("\r\n");
                        strBuf.append("Content-Disposition: form-data; name=\""
                                + inputName + "\"\r\n\r\n");
                        strBuf.append(inputValue);
                    }

                    i++;
                }
                out.write(strBuf.toString().getBytes("UTF-8"));
            }
            // file
            if (!ValidateUtil.isEmpty(bytes)) {
                String contentType = "application/octet-stream";
                StringBuffer strBuf = new StringBuffer();
                strBuf.append("\r\n").append("--").append(boundary)
                        .append("\r\n");
                strBuf.append("Content-Disposition: form-data; name=\""
                        + filename + "\"; filename=\"" + filename + "\"\r\n");
                strBuf.append("Content-Type: " + contentType + "\r\n\r\n");
                out.write(strBuf.toString().getBytes("UTF-8"));
                out.write(bytes);
            }
            byte[] endData = ("\r\n--" + boundary + "--\r\n").getBytes("UTF-8");
            out.write(endData);
            out.flush();
            out.close();

            // 读取返回数据
            StringBuffer strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(), "UTF-8"));
            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line);
            }
            //{"success":{"code":"FileUploadSuccess","data":[{"filename":"20190828_test.png","fileid":"ed7597937f2041efb3e5450b6588b424"}],"message":"文件上传成功"}}
            res = strBuf.toString();
            reader.close();
            reader = null;
        } catch (Exception e) {
            throw new Exception("客户端请求出错: "+e.getMessage());
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }
        Map result =(Map) JSONObject.parse(res);
        Map result_ = (Map) result.get("success");
        List<Map> array = (List)result_.get("data");
        if("FileUploadSuccess".equals(result_.get("code"))){//上传成功
            fileId = array.get(0).get("fileid").toString();
        }else{
            throw new Exception(result_.get("message").toString());
        }
        return fileId;
    }

    /**
     * 文件上传
     * @param filename
     * @param file
     * @return
     * @throws Exception
     */
    public static String fileUpload(String filename, MultipartFile file) throws Exception {
       return fileUpload(filename,file.getBytes());
    }

    /**
     * 文件上传
     * @param filename 文件名
     * @param bos 文件流
     * @return 文件id
     * @throws Exception 异常
     */
    public static String fileUpload(String filename, ByteArrayOutputStream bos) throws Exception {
       return fileUpload(filename,bos.toByteArray());
    }

    /**
     * 文件下载
     * @param fileId
     */
    public static Map fileDownLoad(String fileId){
        OutputStream out = null;
        BufferedReader in = null;
        HttpURLConnection conn = null;
        String encode = "utf-8";
        StringBuffer result = new StringBuffer();
        Map<String, Object> returnMap = new HashMap<String, Object>();
        try {
            //获取下载寻址
            String fullurl = getDownUrl(fileId) ;

            URL realUrl = new URL(fullurl);
            conn = (HttpURLConnection) realUrl.openConnection();
            conn.setConnectTimeout(30000);
            conn.setReadTimeout(120000);
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST"); // POST方法

            // 设置通用的请求属性
            conn.setRequestProperty("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0");
            conn.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded");
            // 打开和URL之间的连接
            conn.connect();
            // 获取URLConnection对象对应的输出流
            out = new DataOutputStream(conn.getOutputStream());
            // flush输出流的缓冲
            out.flush();
            if ("text/json;charset=UTF-8".equals(conn.getContentType())) {
                in = new BufferedReader(
                        new InputStreamReader(conn.getInputStream(), encode));
                String line = null;
                while ((line = in.readLine()) != null) {
                    result.append(line);
                }
            }
            //文件流对象
            returnMap.put("file_inputStream", conn.getInputStream());
            returnMap.put("code","1");
        } catch (Exception e) {
            e.printStackTrace();
            returnMap.put("error", "客户端请求出错: " + e.getMessage());
            returnMap.put("code","-1");
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return returnMap;
    }

    //获取上传寻址
    private static String getUploadUrl() {
        String url = "";
        Map result;
        try {
            result = getUcmPrmByHttp("1", "");
            if (!ValidateUtil.isEmpty(result)){
                if ((Boolean) result.get("bizSuccess")) {
                    url = result.get("data").toString() + ucm_up_url;
                }else{
                    throw new Exception("上传寻址失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return url;
    }

    //获取下载寻址
    private static String getDownUrl(String fileId) {
        String url = "";
        Map result;
        try {
            //{"data":{"fromprovince":"0","accesskey":"gcgC4dVy34wVyzx7HHRYCg","downloadurl":"http://192.168.17.100:8041/cloudstore","crosscity":"0","realid":"10"},"bizSuccess":true}
            result = getUcmPrmByHttp("2", fileId);
            if (!ValidateUtil.isEmpty(result)){
                if((Boolean) result.get("bizSuccess")){
                    Map result_ = (Map)result.get("data");
                    url = result_.get("downloadurl").toString()+ucm_down_url+"?"+
                            "fileid=" + fileId +
                            "&sysid="+sysid+
                            "&addrcode="+addrcode+
                            "&busitype="+busitype+
                            "&loginid=1" +
                            "&realid=" +result_.get("realid").toString()+
                            "&accesskey=" +result_.get("accesskey").toString()+
                            "&crosscity=" +result_.get("crosscity").toString()+
                            "&fromprovince=" +result_.get("fromprovince").toString();
                }else {
                    throw new Exception("下载寻址失败！");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return url;
    }

    /**
     * 获取寻址参数
     *
     * @param flg
     * @param fileid  上传寻址时，该参数可为空
     * @return
     * @throws Exception
     */
    private static Map getUcmPrmByHttp(String flg, String fileid) throws Exception {
        String paramMap = "";
        String http_url="";
        if ("1".equals(flg)) {//上传寻址
            // 上传参数
            paramMap = "sysid=" + sysid + "&addrcode=" + addrcode + "&loginid=1&busitype=FILE&isexternal=" + isexternal;
            http_url = address+address_up;
        } else if ("2".equals(flg)) {//下载寻址
            if (ValidateUtil.isEmpty(fileid)) {
                throw new Exception("文件id为空！");
            }
            //下载参数
            paramMap = "fileid=" + fileid + "&sysid=" + sysid + "&addrcode=" + addrcode + "&loginid=1&busitype=FILE&expiretime=-1&isexternal=" + isexternal;
            http_url = address+address_down;
        }

        Map result = null;
        OutputStreamWriter out = null;
        BufferedReader in = null;
        try {
            URL url = new URL(http_url);
            URLConnection conn = url.openConnection();
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            //post 传参
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(paramMap);
            out.flush();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line;
            StringBuilder resultBuilder = new StringBuilder();
            while ((line = in.readLine()) != null) {
                resultBuilder.append(line);
            }
            // 结果输出
            result = (Map) JSONObject.parse(resultBuilder.toString());
            System.out.print(result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (Exception e) {
            }
        }
        return result;
    }

}

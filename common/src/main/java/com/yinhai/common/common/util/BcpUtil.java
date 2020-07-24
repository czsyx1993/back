package com.yinhai.common.common.util;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.*;

public class BcpUtil {
    private static final String ACCESS_KEY;
    private static final String BCPURL;
    private static final String FORMATE;
    private static final String ISOPENRSA;
    private static final String RSAFILE;

    static {
        ResourceBundle p = null;
        try {
            p = ResourceBundle.getBundle("bcp");
        } catch (Exception e) {
            e.printStackTrace();
        }

        ACCESS_KEY = p.getString("access_key");
        BCPURL = p.getString("bcpUrl");
        FORMATE = p.getString("format");
        ISOPENRSA = p.getString("isOpenRSA");
        RSAFILE = p.getString("rsaFile");
        ;
    }

    public static void main(String[] args) {
        try {
            //System.out.println(call("{id:106}", "test"));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 调用服务集成管理平台接口
     *
     * @param biz_content 参数字符串
     * @param number      接口编号
     * @return 接口回调结果
     * @throws Exception
     */
    public static String call(String biz_content, String number) throws Exception {
        Map<String, String> paramMap = new HashMap<>();
        //参数字符串
        paramMap.put("biz_content", biz_content);
        //系统标识
        paramMap.put("access_key", ACCESS_KEY);
        //返回数据格式
        paramMap.put("format", FORMATE);
        //时间戳
        paramMap.put("timestamp", String.valueOf(System.currentTimeMillis()));

        String source = generateSignSource(paramMap);

        //开启密钥验证
        if ("true".equals(ISOPENRSA)) {
            //私钥证书放在应用工程的classpath目录（一般是resources目录）下
            String sign = sign(source, RSAFILE);
            //原生http调用签名串中的+需要转义为%2B (如果使用httpclient、okhttp等组件不需要)
            sign = sign.replaceAll("[+]", "%2B");
            source += "&sign=" + sign;
        }

        //拼接接口地址
        String address = BCPURL + "/" + number;
        return sendHttp(address, source);
    }

    /**
     * 发送http请求
     *
     * @param address 地址
     * @param param   参数字符串
     * @return 响应结果字符串
     * @throws Exception
     */
    public static String sendHttp(String address, String param) throws Exception {
        OutputStreamWriter out = null;
        BufferedReader in = null;
        try {
            URL url = new URL(address);
            URLConnection conn = url.openConnection();
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            //post传参
            conn.setDoOutput(true);
            conn.setDoInput(true);
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(param);
            out.flush();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder resultBuilder = new StringBuilder();
            while ((line = in.readLine()) != null) {
                resultBuilder.append(line);
            }
            //结果输出
            return resultBuilder.toString();
        } catch (Exception e) {
            //关闭流之后，重新抛出异常
            throw e;
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (Exception e) {
                throw e;
            }
        }
    }


    public static String generateSignSource(Map params) {
        Set<String> keySet = params.keySet();
        List<String> keys = new ArrayList<>();
        for (String key : keySet) {
            if (params.get(key) != null && StringUtils.isNotBlank(params.get(key).toString())) {
                keys.add(key);
            }
        }
        Collections.sort(keys);
        StringBuilder builder = new StringBuilder();
        for (int i = 0, size = keys.size(); i < size; i++) {
            String key = keys.get(i);
            Object value = params.get(key);
            builder.append(key);
            builder.append("=");
            builder.append(value);
            //拼接时，不包括最后一个&字符
            if (i != size - 1) {
                builder.append("&");
            }
        }
        return builder.toString();
    }

    private static InputStream getResourceAsStream(String resource) throws IOException {
        InputStream in = null;
        ClassLoader loader = BcpUtil.class.getClassLoader();
        if (loader != null) {
            in = loader.getResourceAsStream(resource);
        }
        if (in == null) {
            in = ClassLoader.getSystemResourceAsStream(resource);
        }
        if (in == null) {
            throw new IOException("请将密钥文件" + resource + "放到工程classpath目录！");
        }
        return in;
    }

    public static String sign(String source, String keyFile) throws Exception {
        //读取解析私钥（解析完成的PrivateKey对象建议缓存起来）
        InputStream in = getResourceAsStream(keyFile);
        PrivateKey privateKey = null;
        String sign = null;
        try {
            byte[] keyBytes = IOUtils.toByteArray(in);
            byte[] encodedKey = Base64.getDecoder().decode(keyBytes);
            KeySpec keySpec = new PKCS8EncodedKeySpec(encodedKey);
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            privateKey = keyFactory.generatePrivate(keySpec);
        } finally {
            IOUtils.closeQuietly(in);
        }
        if (privateKey != null) {
            //签名
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initSign(privateKey);
            signature.update(source.getBytes());
            byte[] signed = signature.sign();
            //取base64，得到签名串
            sign = Base64.getEncoder().encodeToString(signed);
        }
        return sign;
    }
}

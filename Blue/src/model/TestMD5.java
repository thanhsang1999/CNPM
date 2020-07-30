package model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TestMD5 {
    public static void main(String[] args) throws NoSuchAlgorithmException {
    	MD5 md5 = new MD5();
        System.out.println(md5.convertHashToString("12345678"));
        System.out.println(md5.covertCheckSum("D:/red.png"));
    }

}
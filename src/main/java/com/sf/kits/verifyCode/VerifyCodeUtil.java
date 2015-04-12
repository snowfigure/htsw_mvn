package com.sf.kits.verifyCode;

import java.awt.*;
import java.util.Random;

/**
 * ��֤�����ɹ���
 * Created by snowfigure on 2015/4/11.
 */
public class VerifyCodeUtil {
    /**
     * ��ʼ��֤�����
     */
    private static final String chars = "23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz";
    private static final int WIDTH = 150;
    private static final int HEIGHT = 50;

    /**
     * ���������
     *
     * @return
     */
    private char[] getCode(int length) {
        char[] rands = new char[length];
        for (int i = 0; i < length; i++) {
            int rand = (int) (Math.random() * chars.length());
            rands[i] = chars.charAt(rand);
        }
        return rands;
    }

    /**
     * ���Ʊ���
     *
     * @param g
     */
    private void drawBackground(Graphics g) {
        g.setColor(new Color(255, 255, 255));
        g.fillRect(0, 0, WIDTH, HEIGHT);
        Random random = new Random();
        int len = 0;
        while (len <= 5) {
            len = random.nextInt(15);
        }
        for (int i = 0; i < len; i++) {
            int x = random.nextInt(WIDTH);
            int y = random.nextInt(HEIGHT);
            int red = 255 - random.nextInt(200);
            int green = 255 - random.nextInt(200);
            int blue = 255 - random.nextInt(200);
            g.setColor(new Color(red, green, blue));
            // g.drawLine(x, y, random.nextInt(WIDTH)-x,
            // random.nextInt(HEIGHT)-y);
            g.drawOval(x, y, 2, 2);
        }
    }

    /**
     * ������֤��
     *
     * @param g
     * @param rands
     */
    private void drawRands(Graphics g, char[] rands) {
        Random random = new Random();

        g.setFont(new Font("����", Font.ITALIC | Font.BOLD, 45));
        for (int i = 0; i < rands.length; i++) {
            int red = random.nextInt(255);
            int green = random.nextInt(255);
            int blue = random.nextInt(255);
            g.setColor(new Color(red, green, blue));
            g.drawString("" + rands[i], i * 40, 40);
        }
    }

    //ʹ�÷���
//    public void jpg()
//    {
//        HttpServletResponse response = getResponse();
//        HttpSession session = getSession();
//        response.setContentType( "image/jpeg" );
//
//        // ��ֹ���������
//        response.setHeader( "Pragma", "No-cache" );
//        response.setHeader( "Cache-Control", "no-cache" );
//        response.setDateHeader( "Expires", 0 );
//
//        BufferedImage image = new BufferedImage( WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB );
//        Graphics g = image.getGraphics();
//        char[] rands = getCode( 4 );
//        drawBackground( g );
//        drawRands( g, rands );
//        g.dispose();
//        try
//        {
//            ServletOutputStream out = response.getOutputStream();
//            ByteArrayOutputStream bos = new ByteArrayOutputStream();
//            ImageIO.write( image, "PNG", bos );
//            byte[] buf = bos.toByteArray();
//            response.setContentLength( buf.length );
//            out.write( buf );
//            bos.close();
//            out.close();
//            session.setAttribute( "check", new String( rands ).toLowerCase() );
//        }
//        catch ( Exception e )
//        {
//        }
//        renderNull();
//    }


}

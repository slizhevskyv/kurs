package controller;


import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.DAOFactory;
import dao.OrderDAO;
import entity.Order;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "DownloadFile", urlPatterns = "/admin/downloadFile")
public class DownloadFile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderService service = new OrderServiceImpl();
        boolean result = service.createFile();
        if(result) {
            File file = new File("D:\\file.pdf");
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename=" + file.getName());
            response.setContentLength((int)file.length());
            ServletOutputStream servletOutputStream = response.getOutputStream();
            BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            int bytesRead = bufferedInputStream.read();
            while(bytesRead != -1) {
                servletOutputStream.write(bytesRead);
                bytesRead = bufferedInputStream.read();
            }
            if(servletOutputStream != null) {
                servletOutputStream.close();
            }
            if(bufferedInputStream != null) {
                bufferedInputStream.close();
            }
        }
    }
}

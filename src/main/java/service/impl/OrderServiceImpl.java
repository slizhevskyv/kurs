package service.impl;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.DAOFactory;
import dao.OrderDAO;
import entity.Order;
import service.OrderService;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private final String fileName = "D:\\file.pdf";
    public boolean createFile() {
        DAOFactory factory = DAOFactory.getInstance();
        OrderDAO dao = factory.getOrderDAO();
        List<Order> list = dao.getAllOrders();
        Date dateNow = new Date();
        SimpleDateFormat formatForDateNow = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String date = "Таблица сгенерирована: " + formatForDateNow.format(dateNow);
        try {
            Document document = new Document(PageSize.A2, 0, 50, 50, 0);
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(fileName, false));
            document.open();
            final String FONT = "c:/windows/fonts/arial.ttf";
            BaseFont baseFont = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, true);
            Font font = new Font(baseFont);
            PdfPTable table = new PdfPTable(8);
            table.setTotalWidth(1000);
            table.setSpacingAfter(25);
            table.setSpacingBefore(25);
            PdfPCell th1 = new PdfPCell(new Phrase("№", font));
            PdfPCell th2 = new PdfPCell(new Phrase("Пункт отправления", font));
            PdfPCell th3 = new PdfPCell(new Phrase("Пункт прибытия", font));
            PdfPCell th4 = new PdfPCell(new Phrase("Имя заказчика", font));
            PdfPCell th5 = new PdfPCell(new Phrase("Телефон", font));
            PdfPCell th6 = new PdfPCell(new Phrase("Стоимость заказа", font));
            PdfPCell th7 = new PdfPCell(new Phrase("Тип машины", font));
            PdfPCell th8 = new PdfPCell(new Phrase("Дополнительные требования", font));
            table.addCell(th1);
            table.addCell(th2);
            table.addCell(th3);
            table.addCell(th4);
            table.addCell(th5);
            table.addCell(th6);
            table.addCell(th7);
            table.addCell(th8);
            for (int i = 0; i < list.size(); i++) {
                String index = String.valueOf(i + 1);
                table.addCell(new Phrase(index, font));
                String departure = list.get(i).getPointOfDeparture();
                table.addCell(new Phrase(departure, font));
                String destination = list.get(i).getDestination();
                table.addCell(new Phrase(destination, font));
                String customerName = list.get(i).getCustomerName();
                table.addCell(new Phrase(customerName, font));
                String phoneNumber = list.get(i).getPhoneNumber();
                table.addCell(new Phrase(phoneNumber, font));
                String cost = String.valueOf(list.get(i).getCost());
                table.addCell(new Phrase(cost, font));
                String typeOfMachine = list.get(i).getTypeOfMachine();
                table.addCell(new Phrase(typeOfMachine, font));
                String req = list.get(i).getAddRequirement();
                table.addCell(new Phrase(req, font));
            }
            Paragraph headParagraph = new Paragraph(date, font);
            headParagraph.setAlignment(Element.ALIGN_RIGHT);
            headParagraph.setSpacingAfter(50);
            document.add(headParagraph);
            document.add(table);
            document.close();
            return true;
        } catch (DocumentException e) {
            e.printStackTrace();
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }

}

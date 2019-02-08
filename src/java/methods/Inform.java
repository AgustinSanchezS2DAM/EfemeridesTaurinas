/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package methods;

import Entities.Efemeride;
import Entities.Personaje;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author agustin
 */
public class Inform {

    public void generateInformPDF(HttpServletRequest request, HttpServletResponse response, Personaje p) throws ServletException, IOException {

        response.setContentType("application/pdf");

        Document documento = new Document(PageSize.A4.rotate());

        try {

            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();

            documento.addAuthor("Efemérides Taurinas");
            documento.addTitle("Efemérides Taurinas");
            documento.addCreationDate();

            Font bold = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            Paragraph paraName = new Paragraph(p.getNombrepersonaje().toUpperCase() + " " + p.getApellido1().toUpperCase() + " " + p.getApellido2().toUpperCase(), bold);
            paraName.setAlignment(Element.ALIGN_JUSTIFIED);
            PdfPTable table = new PdfPTable(1);
            PdfPCell cell1 = new PdfPCell(paraName);
            cell1.setColspan(5);
            cell1.setBorderColor(BaseColor.WHITE);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell1);
            table.setSpacingAfter(25);
            documento.add(table);

            PdfPTable table2 = new PdfPTable(2);
            table2.setWidths(new float[]{30, 70});

            DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");

            table2.addCell("Nombre");
            table2.addCell(p.getNombrepersonaje());

            table2.addCell("Primer Apellido");
            table2.addCell(p.getApellido1());

            table2.addCell("Segundo Apellido");
            table2.addCell(p.getApellido2());

            table2.addCell("Primer Apodo");
            table2.addCell(p.getApodo1());

            table2.addCell("Segundo Apodo");
            table2.addCell(p.getApodo2());

            table2.addCell("Nombre de cartel");
            table2.addCell(p.getNombrecartel());

            table2.addCell("Provincia Actual");
            table2.addCell(p.getProvinciaactual());

            table2.addCell("Provincia Nacimiento");
            table2.addCell(p.getProvincianacimiento());

            String fechaalternativaEdit = "";
            String fechanacimientoEdit = "";
            String fechapicadoresEdit = "";
            String fechapresentacionEdit = "";

            if (p.getFechanacimiento() != null) {
                fechanacimientoEdit = dateFormat.format(p.getFechanacimiento());
            }

            table2.addCell("Fecha de nacimiento");
            table2.addCell(fechanacimientoEdit);

            if (p.getFechapicadores() != null) {
                fechapicadoresEdit = dateFormat.format(p.getFechapicadores());
            }

            table2.addCell("Fecha de Picadores");
            table2.addCell(fechapicadoresEdit);

            if (p.getFechapresentacion() != null) {
                fechapresentacionEdit = dateFormat.format(p.getFechapresentacion());
            }

            table2.addCell("Fecha de presentación");
            table2.addCell(fechapresentacionEdit);

            if (p.getFechaalternativa() != null) {
                fechaalternativaEdit = dateFormat.format(p.getFechaalternativa());
            }

            table2.addCell("Fecha de alternativa");
            table2.addCell(fechaalternativaEdit);

            table2.addCell("Dirección");
            table2.addCell(p.getDireccion());

            table2.addCell("Teléfono");
            table2.addCell(p.getTelefono());

            table2.addCell("Contacto");
            table2.addCell(p.getPersonadecontacto());

            table2.addCell("Localidad actual");
            table2.addCell(p.getPueblonacimiento());

            table2.addCell("Localidad nacimiento");
            table2.addCell(p.getPueblonacimiento());

            table2.addCell("Correo");
            table2.addCell(p.getCorreo());

            table2.addCell("Biografía");
            table2.addCell(p.getBiografia());

            table2.addCell("Notas");
            table2.addCell(p.getNotas());

            int contador = 1;
            for (int i = 0; i < p.getProfesionList().size(); i++) {
                table2.addCell(contador + "º Profesión");
                table2.addCell(p.getProfesionList().get(i).getDescripcion());
                contador++;
            }

            table2.setSpacingBefore(50);
            documento.add(table2);
            System.out.println("Documento creado");

            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
            de.printStackTrace();
        }

    }

    public void generateInformPDFEfemeride(HttpServletRequest request, HttpServletResponse response, Efemeride e) throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");

        Document documento = new Document(PageSize.A4.rotate());

        try {

            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();

            documento.addAuthor("Efemérides Taurinas");
            documento.addTitle("Efemérides Taurinas");
            documento.addCreationDate();

            Font bold = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            Paragraph paraName = new Paragraph("EFEMÉRIDE");
            paraName.setAlignment(Element.ALIGN_JUSTIFIED);
            PdfPTable table = new PdfPTable(1);
            PdfPCell cell1 = new PdfPCell(paraName);
            cell1.setColspan(5);
            cell1.setBorderColor(BaseColor.WHITE);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell1);
            table.setSpacingAfter(25);
            documento.add(table);

            //DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");
            DateFormat dateFormat = new SimpleDateFormat("dd MMMM, yyyy", Locale.ENGLISH);

            PdfPTable table2 = new PdfPTable(2);

            String fechaefemeride = "";
            String fechareal = "";

            if (e.getFechaefemeride() != null) {
                fechaefemeride = dateFormat.format(e.getFechaefemeride());
            }

            table2.addCell("Fecha Efeméride");
            table2.addCell(fechaefemeride);

            table2.addCell("Título del evento");
            table2.addCell(e.getTipoevento());

            table2.addCell("Localidad");
            table2.addCell(e.getPueblo());

            table2.addCell("Provincia");
            table2.addCell(e.getProvincia());

            if (e.getFechareal() != null) {
                fechareal = dateFormat.format(e.getFechareal());
            }

            table2.addCell("Fecha Real");
            table2.addCell(fechareal);

            table2.addCell("Ganadería");
            table2.addCell(e.getGanaderia());

            table2.addCell("Reportaje");
            table2.addCell(e.getReportaje());

            table2.addCell("Cartel");
            table2.addCell(e.getCartel());

            table2.addCell("Notas");
            table2.addCell(e.getNotas());

            table2.addCell("Fuente");
            table2.addCell(e.getFuente());

            table2.setSpacingBefore(50);

            documento.add(table2);

            Paragraph paraName2 = new Paragraph("PERSONAJES");
            paraName2.setAlignment(Element.ALIGN_JUSTIFIED);
            PdfPTable tableTitle = new PdfPTable(1);
            PdfPCell cell3 = new PdfPCell(paraName2);
            cell3.setColspan(5);
            cell3.setBorderColor(BaseColor.WHITE);
            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
            tableTitle.addCell(cell3);

            tableTitle.setSpacingBefore(25);
            documento.add(tableTitle);

            PdfPTable tablePersonajes = new PdfPTable(3);
            for (Personaje p : e.getPersonajeList()) {
                tablePersonajes.addCell("Personaje");
                tablePersonajes.addCell(p.getNombrepersonaje() + " " + p.getApellido1() + " " + p.getApellido2());
                tablePersonajes.addCell('"' + p.getApodo1() + '"');
            }
            tablePersonajes.setSpacingBefore(50);
            documento.add(tablePersonajes);

            System.out.println("Documento creado");

            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
        }

    }

}

package com.ikonique.util;

import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;


//

public class GeneratePdf {
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
		String filename = "E:\\invoice.pdf";
		Document document = new Document();
		 
		// Simple Para....
			PdfWriter.getInstance(document, new FileOutputStream(filename));
			document.open();
			Paragraph paragraph = new Paragraph("Hello My Name Is Meet Suthar!!!");
			document.add(paragraph);
			
			
			// for space
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			
		// add table...
			
			PdfPTable table = new PdfPTable(3);
			PdfPCell c1 = new PdfPCell(new Phrase("heading 1"));
			table.addCell(c1);
			
			c1 = new PdfPCell(new Phrase("heading 2"));
			table.addCell(c1);
			c1 = new PdfPCell(new Phrase("heading 3"));
			table.addCell(c1);
			table.setHeaderRows(1);
			
			table.addCell("1.0");
			table.addCell("1.1");
			table.addCell("1.2");
			table.addCell("2.1");
			table.addCell("2.2");
			table.addCell("2.3");
			
			document.add(table);
			
			//add image
			//document.add(Image.getInstance("E:\\MEET DOC\\PIC-2.jpg"));
			
			
			//add chart
			
						document.close();
			System.out.println("File is generated");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
		
	}

}

package com.analysis.excel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi3.hssf.usermodel.HSSFCell;
import org.apache.poi3.hssf.usermodel.HSSFCellStyle;
import org.apache.poi3.hssf.usermodel.HSSFFont;
import org.apache.poi3.hssf.usermodel.HSSFPalette;
import org.apache.poi3.hssf.usermodel.HSSFRichTextString;
import org.apache.poi3.hssf.usermodel.HSSFRow;
import org.apache.poi3.hssf.usermodel.HSSFSheet;
import org.apache.poi3.hssf.usermodel.HSSFWorkbook;
import org.apache.poi3.hssf.util.HSSFColor;

/**
 * 
 * @author chenhao
 * 
 */
public class ExcelBuilder {

	/**
	 * @功能：
	 * 
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		// HSSFWorkbook wb = new HSSFWorkbook();
		// HSSFSheet sheet = wb.createSheet();
		ExcelBuilder eb = new ExcelBuilder();
		// eb.createHead(sheet, wb);
		List list = new ArrayList();
		Object[] objs = new Object[] { new BigDecimal(12), "北京电力公司",
				new BigDecimal(20) };
		list.add(objs);
		HSSFWorkbook wb = eb.createExcel(list, null);
		// eb.writeDataToExcel(list, sheet, wb, 2);

		FileOutputStream fileOut = new FileOutputStream("d:\\经费分摊2.xls");
		wb.write(fileOut);
		fileOut.close();
	}

	@SuppressWarnings("unchecked")
	public HSSFWorkbook createExcel(List list, String[] titles) {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet();
		this.createHead(sheet, wb, titles);
		this.writeDataToExcel(list, sheet, wb, 2);
		return wb;
	}

	private int[] getColors(String str) {
		int[] color = new int[3];
		color[0] = Integer.parseInt(str.substring(1, 3), 16);
		color[1] = Integer.parseInt(str.substring(3, 5), 16);
		color[2] = Integer.parseInt(str.substring(5, 7), 16);
		return color;
	}

	/**
	 * 
	 * @功能：创建表头
	 * 
	 * @param sheet
	 * @param wb
	 */
	public void createHead(HSSFSheet sheet, HSSFWorkbook wb, String[] titles) {
		sheet.setColumnWidth(0, 2200);
		sheet.setColumnWidth(1, 8500);
		sheet.setColumnWidth(2, 3500);

		HSSFRow row = null;
		HSSFCellStyle style = null;
		row = getHSSFRow(sheet, 0, 400);
		// style = getHSSFCellStyle(wb, HSSFColor.LIGHT_GREEN.index);//
		// 创建样式，单元个底部颜色为淡黄

		int[] colors = this.getColors("#63cefd");
		HSSFPalette palette = wb.getCustomPalette();
		palette.setColorAtIndex(HSSFColor.BLACK.index, (byte) colors[0],
				(byte) colors[1], (byte) colors[2]);

		style = getHSSFCellStyle(wb, HSSFColor.LIGHT_GREEN.index);
		// style = wb.createCellStyle();
		this.setFont(wb, style, "宋体", 200, HSSFFont.BOLDWEIGHT_BOLD);// 设置字体
		setBorder(style, 1, HSSFColor.BLACK.index);// 设置边框
		style.setWrapText(true);

		// 设置表头第一行
		createCell(style, row, 0, titles[0]);
		createCell(style, row, 1, titles[1]);
		createCell(style, row, 2, titles[2]);
	}

	/**
	 * 
	 * @功能：设置头，只有一行
	 * 
	 * @param sheet
	 * @param colNames
	 *            要显示的头的列名
	 */
	public void createCommonHead(HSSFWorkbook wb, HSSFSheet sheet,
			String[] colNames) {
		if (colNames == null || colNames.length == 0) {
			wb = null;
			sheet = null;
			return;
		}
		HSSFCellStyle style = null;

		// style = getHSSFCellStyle(wb, HSSFColor.LIGHT_GREEN.index);//
		// 创建样式，单元个底部颜色为淡黄
		style = getHSSFCellStyle(wb, HSSFColor.LIGHT_BLUE.index);
		this.setFont(wb, style, "宋体", 200, HSSFFont.BOLDWEIGHT_BOLD);// 设置字体
		setBorder(style, 1, HSSFColor.BLACK.index);// 设置边框
		style.setWrapText(true);
		HSSFRow row = null;

		// 设置表头第一行
		row = this.getHSSFRow(sheet, 0, 600);
		for (int i = 0; i < colNames.length; i++) {
			this.createCell(style, row, i, colNames[i]);
		}
	}

	/**
	 * 
	 * @功能：把数据集写到表格中
	 * 
	 * @param list
	 *            数据集
	 * @param sheet
	 * @param wb
	 * @param fromRow
	 *            写入的开始行
	 */
	@SuppressWarnings("unchecked")
	public void writeDataToExcel(List list, HSSFSheet sheet, HSSFWorkbook wb,
			int fromRow) {
		if (list == null || list.isEmpty()) {
			return;
		}
		HSSFRow row = null;
		// 新建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setWrapText(true);
		setBorder(style, 1, HSSFColor.BLACK.index);
		Object[] objs = null;
		for (int i = 0; i < list.size(); i++) {
			objs = (Object[]) list.get(i);
			if (objs == null)
				continue;
			row = getHSSFRow(sheet, i + fromRow - 1, 400);// 从第三行开始设置正文
			for (int j = 0; j < objs.length; j++) {
				if (objs[j] instanceof String || objs[j] == null
						|| "".equals(objs[j])) {
					this.createCell(style, row, j, objs[j],
							HSSFCell.CELL_TYPE_STRING);
				} else if (objs[j] instanceof BigDecimal) {
					this.createCell(style, row, j, objs[j],
							HSSFCell.CELL_TYPE_NUMERIC);
				}
			}
		}
	}

	/**
	 * 
	 * @功能：往单元格中写值
	 * 
	 * @param style
	 *            单元格样式
	 * @param r
	 *            行
	 * @param col
	 *            列
	 * @param value
	 *            值
	 */
	public void createCell(HSSFCellStyle style, HSSFRow row, int col,
			Object value, int cellType) {
		HSSFCell cell = row.createCell(col);
		if (cellType == HSSFCell.CELL_TYPE_STRING) {
			if (value != null && value instanceof BigDecimal) {
				BigDecimal dec = (BigDecimal) value;
				cell.setCellValue(dec.doubleValue());
				dec = null;
			} else
				cell.setCellValue(new HSSFRichTextString(
						(String) (value == null ? "" : value)));
		} else if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
			if (value != null) {
				BigDecimal dec = (BigDecimal) value;
				cell.setCellValue(dec.doubleValue());
				dec = null;
			}
		}
		cell.setCellStyle(style);

		cell = null;
	}

	/**
	 * 
	 * @功能：创建一行
	 * 
	 * @param sheet
	 * @param r
	 *            行号
	 * @param heigth
	 *            行高
	 * @return
	 */
	public HSSFRow getHSSFRow(HSSFSheet sheet, int r, int heigth) {
		HSSFRow row = null;
		row = sheet.createRow(r);
		row.setHeight((short) heigth);

		return row;
	}

	/**
	 * 
	 * @功能：设置单元格的边框
	 * 
	 * @param style
	 * @param border
	 *            边框厚度
	 * @param color
	 *            边框颜色
	 */
	public void setBorder(HSSFCellStyle style, int border, short color) {
		style.setBorderLeft((short) border);// 左邊框
		style.setBottomBorderColor(color);// 邊框顏色
		style.setBorderRight((short) border);// 有邊框
		style.setBottomBorderColor(color);// 邊框顏色
		style.setBorderTop((short) border);// 頂邊框
		style.setBottomBorderColor(color);// 邊框顏色
		style.setBorderBottom((short) border);// 底邊框
		style.setBottomBorderColor(color);// 邊框顏色
	}

	public void setFont(HSSFWorkbook wb, HSSFCellStyle style, String fontName,
			int fontHeight, short bw) {
		HSSFFont font = wb.createFont();
		font.setFontName(fontName);
		font.setFontHeight((short) fontHeight);
		font.setBoldweight(bw);
		style.setFont(font);
		font = null;
	}

	/**
	 * 
	 * @功能：往单元格中写值
	 * 
	 * @param style
	 *            单元格样式
	 * @param r
	 *            行
	 * @param col
	 *            列
	 * @param value
	 *            值
	 */
	public void createCell(HSSFCellStyle style, HSSFRow row, int col,
			String value) {
		HSSFCell cell = row.createCell(col);
		cell.setCellValue(new HSSFRichTextString(value));
		cell.setCellStyle(style);
		cell = null;

	}

	/**
	 * 
	 * @功能 样式
	 * 
	 * @param wb
	 * @param fgColor
	 * @return
	 */
	public HSSFCellStyle getHSSFCellStyle(HSSFWorkbook wb, short fgColor) {
		HSSFCellStyle style = wb.createCellStyle();
		style.setFillForegroundColor(fgColor);// 设置单元格背景色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
		return style;
	}

	/**
	 * 
	 * @功能：下载
	 * 
	 * @param wb
	 * @param response
	 * @param fileName
	 *            文件名称
	 */
	public void downloadExcel(HSSFWorkbook wb, HttpServletResponse response,
			String fileName) {
		if (wb == null || wb.getSheetAt(0) == null)
			throw new NullPointerException("生成Excel文件出错!");
		try {
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String(fileName.getBytes("GB2312"), "ISO8859-1"));

			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
			os = null;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String encodingFileName(String fileName) {
		String returnFileName = "";
		try {
			returnFileName = URLEncoder.encode(fileName, "UTF-8");
			if (returnFileName.length() > 150) {
				returnFileName = new String(fileName.getBytes("GB2312"),
						"ISO8859-1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnFileName;
	}
}

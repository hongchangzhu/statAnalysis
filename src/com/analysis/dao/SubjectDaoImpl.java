package com.analysis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.analysis.db.DBConnection;
import com.analysis.po.BookCatelog;
import com.analysis.po.PubVer;
import com.analysis.po.Subject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.red.crm.MetadataServiceUtils;

public class SubjectDaoImpl {
	public void saveAll() {
		// ѧ��
		String jsonData = MetadataServiceUtils.getSubjectList();
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		// ��json��ʽ�ַ�������ת��Ϊ���󼯺�,Ȼ�󱣴��ڱ������ݿ���
		List<Subject> list = g.fromJson(jsonData,
				new TypeToken<List<Subject>>() {
				}.getType());
		System.out.println("Զ��ѧ�����ݣ�" + jsonData);
		// ѧ��
		this.saveSubject(list);

		List<PubVer> verList = new ArrayList<PubVer>();
		for (Subject sub : list) {
			String subjectId = sub.getSubjectId();
			// �̲İ汾
			jsonData = MetadataServiceUtils.getPubVerList(subjectId);
			System.out.println("Զ�̲̽İ汾���ݣ�" + jsonData);
			List<PubVer> verItems = g.fromJson(jsonData,
					new TypeToken<List<PubVer>>() {
					}.getType());
			if (verItems != null)
				for (PubVer ver : verItems) {
					ver.setSubjectId(subjectId);
					verList.add(ver);
				}
		}
		// �汾
		this.savePubVer(verList);

		List<BookCatelog> bookList = new ArrayList<BookCatelog>();
		for (PubVer ver : verList) {
			String subjectId = ver.getSubjectId();
			String versionId = ver.getVersionId();

			// �̲��½�
			jsonData = MetadataServiceUtils.getBookCat(versionId);
			System.out.println("Զ�̲̽��½����ݣ�" + jsonData);
			List<BookCatelog> bookItems = g.fromJson(jsonData,
					new TypeToken<List<BookCatelog>>() {
					}.getType());
			if (bookItems != null)
				for (BookCatelog book : bookItems) {
					book.setSubjectId(subjectId);
					book.setVersionId(versionId);
					bookList.add(book);
				}
		}
		// �̲��½�
		this.saveBookCatelog(bookList);

	}

	/**
	 * �̲��½�
	 * 
	 * @param bookList
	 */
	public void saveBookCatelog(List<BookCatelog> bookList) {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String insert = "insert into t_book_catelog(book_catelog_id, book_catelog_name, parent_id, version_id, subject_id, seq_no)"
					+ " values(?,?,?,?,?,?)";
			stmt = con.prepareStatement(insert);
			for (BookCatelog book : bookList) {
				stmt.setString(1, book.getBookCatelogId());
				stmt.setString(2, book.getBookCatelogName());
				stmt.setString(3, book.getParentId());
				stmt.setString(4, book.getVersionId());
				stmt.setString(5, book.getSubjectId());
				stmt.setBigDecimal(6, book.getSeqNo());
				stmt.execute();
			}
			con.commit();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}

	/**
	 * ����id��ȡѧ������
	 * 
	 * @param subjectId
	 * @return
	 */
	public String getSubjectNameBySubjectId(String subjectId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String subjectName = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select subject_name from t_subject t where t.subject_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, subjectId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				subjectName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return subjectName;
	}

	/**
	 * ͨ���꼶id��ȡ�꼶����
	 * 
	 * @param gradeId
	 * @return
	 */
	public String getGradeNameByGradeId(String gradeId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String gradeName = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select book_catelog_name from t_book_catelog t where t.book_catelog_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, gradeId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				gradeName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return gradeName;
	}

	/**
	 * ѧ��
	 * 
	 * @param list
	 */
	public void saveSubject(List<Subject> list) {
		Connection con = null;
		PreparedStatement stmt = null;
		// ѧ��
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String insert = "insert into t_subject(subject_id, subject_name, seq_no) values(?,?,?)";
			stmt = con.prepareStatement(insert);
			for (Subject sub : list) {
				stmt.setString(1, sub.getSubjectId());
				stmt.setString(2, sub.getSubjectName());
				stmt.setBigDecimal(3, sub.getSeqNo());
				stmt.execute();
			}
			con.commit();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}

	public List<Subject> getAllSubject() {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Subject> list = new ArrayList<Subject>();
		Subject subject = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select subject_id, subject_name, seq_no from t_subject order by seq_no";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				subject = new Subject();
				subject.setSubjectId(rs.getString(1));
				subject.setSubjectName(rs.getString(2));
				// subject.setSeqNo(rs.getBigDecimal(3));
				list.add(subject);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return list;
	}

	public List<BookCatelog> getAllBookCatelog(String subjectId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<BookCatelog> list = new ArrayList<BookCatelog>();
		BookCatelog book = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select book_catelog_id, book_catelog_name from t_book_catelog where parent_id='-1' and subject_id = ? order by seq_no";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, subjectId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				book = new BookCatelog();
				book.setBookCatelogId(rs.getString(1));
				book.setBookCatelogName(rs.getString(2));
				list.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return list;
	}

	/**
	 * �汾
	 * 
	 * @param verList
	 */
	public void savePubVer(List<PubVer> verList) {
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String insert = "insert into t_version(version_id, version_name, subject_id, seq_no) values(?,?,?,?)";
			stmt = con.prepareStatement(insert);
			for (PubVer ver : verList) {
				stmt.setString(1, ver.getVersionId());
				stmt.setString(2, ver.getVersionName());
				stmt.setString(3, ver.getSubjectId());
				stmt.setBigDecimal(4, ver.getSeqNo());
				stmt.execute();
			}
			con.commit();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}

	public void deleteAll() {
		this.deleteBookCatelog();
		this.deletePubVerion();
		this.deleteSubject();
	}

	public void deleteBookCatelog() {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String delete = "delete from t_book_catelog";
			stmt = con.prepareStatement(delete);
			stmt.execute();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}

	public void deletePubVerion() {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String delete = "delete from t_version";
			stmt = con.prepareStatement(delete);
			stmt.execute();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}

	public void deleteSubject() {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String delete = "delete from t_subject";
			stmt = con.prepareStatement(delete);
			stmt.execute();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
	}
}

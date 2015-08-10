package com.analysis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.analysis.db.DBConnection;
import com.analysis.po.School;
import com.analysis.po.Term;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.red.crm.MetadataServiceUtils;

public class TermDaoImpl {

	public List<Term> getAllTermByRegionId(String regionId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Term> list = new ArrayList<Term>();
		Term term = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select t.term_id,t.term_name from t_term t where t.regoin_id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, regionId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				term = new Term();
				term.setTermId(rs.getString(1));
				term.setTermName(rs.getString(2));
				list.add(term);
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
	 * 
	 * @���ܣ�����Զ�̽ӿڻ�ȡ�ն����ݲ������ڱ������ݿ�
	 * 
	 */
	public void saveAll(String regionId, String schoolType) {
		// Զ�̵��÷����ȡ�ն�����,���ص���json��ʽ�ַ���
		String jsonData = MetadataServiceUtils.getSchoolList(regionId,
				schoolType);
		// System.out.println(jsonData);
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		// ��json��ʽ�ַ�������ת��Ϊ���󼯺�,Ȼ�󱣴��ڱ������ݿ���
		List<School> list = g.fromJson(jsonData, new TypeToken<List<School>>() {
		}.getType());
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String insert = "insert into t_term(term_id,term_name,province_id,city_id,regoin_id,school_type,version_no,xxjgbxlxm3)"
					+ " values(?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(insert);
			for (School school : list) {
				stmt.setString(1, school.getSchoolId());
				stmt.setString(2, school.getSchoolName());
				stmt.setString(3, school.getProvinceId());
				stmt.setString(4, school.getCityId());
				stmt.setString(5, school.getCountyId());
				stmt.setString(6, school.getSchoolType());
				stmt.setBigDecimal(7, school.getVNo());
				stmt.setString(8, school.getXXJGBXLXM3());
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
	 * 
	 * @���ܣ�ɾ���ն˱��е���������
	 * 
	 */
	public void deleteAll(String regionId, String schoolType) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String delete = "delete from t_term where regoin_id=? and school_type=?";
			stmt = con.prepareStatement(delete);
			stmt.setString(1, regionId);
			stmt.setString(2, schoolType);

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

package com.analysis.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.analysis.db.DBConnection;
import com.analysis.po.Regoin;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.red.crm.MetadataServiceUtils;

public class RegionDaoImpl {

	/**
	 * 
	 * @���ܣ��û��ս���ͳ��ҳ��ʱĬ�Ͽ������Ǳ��������ݣ�������ҲĬ����ʾ����
	 * 
	 * @return
	 */
	public Regoin getDefaultRegoin() {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Regoin regoin = null;
		try {
			con = DBConnection.getConnection();
			String insert = "select * from t_region t where t.parent_id='1' and t.node_name like '����%'";
			stmt = con.prepareStatement(insert);
			rs = stmt.executeQuery();

			while (rs.next()) {
				regoin = new Regoin();
				regoin.setId(rs.getString(1));
				regoin.setParentId(rs.getString(2));
				regoin.setNodeName(rs.getString(3));
				regoin.setVersionNo(rs.getBigDecimal(4));
				regoin.setNodeType(rs.getString(5));
				regoin.setSeqNo(rs.getBigDecimal(6));
				regoin.setNationalCode(rs.getString(7));
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return regoin;
	}

	/**
	 * 
	 * @���ܣ���ѯcodePath
	 * 
	 * @param id
	 * @return
	 */
	public String getCodePath(String id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String codePath = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select code_path from t_region t where t.id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			while (rs.next()) {
				codePath = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return codePath;
	}

	/**
	 * 
	 * @���ܣ���ѯRegoin
	 * 
	 * @param id
	 * @return
	 */
	public Regoin getRegion(String id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Regoin regoin = null;
		try {
			con = DBConnection.getConnection();
			String sql = "select * from t_region t where t.id=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();

			while (rs.next()) {
				regoin = new Regoin();
				regoin.setId(rs.getString(1));
				regoin.setParentId(rs.getString(2));
				regoin.setNodeName(rs.getString(3));
				regoin.setVersionNo(rs.getBigDecimal(4));
				regoin.setNodeType(rs.getString(5));
				regoin.setSeqNo(rs.getBigDecimal(6));
				regoin.setNationalCode(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt);
			DBConnection.closeConnection(con);
		}
		return regoin;
	}

	/**
	 * 
	 * @���ܣ���ѯ�����¼�����������
	 * 
	 * @param pid
	 * @return
	 */
	public List<Regoin> getUnderline(String pid) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Regoin> list = new ArrayList<Regoin>();
		Regoin regoin = null;
		try {
			con = DBConnection.getConnection();
			String insert = "select id,parent_id,node_name,v_no,node_type,seq_no,national_code from t_region t where t.parent_id=? order by t.seq_no";
			stmt = con.prepareStatement(insert);
			stmt.setString(1, pid);
			rs = stmt.executeQuery();

			while (rs.next()) {
				regoin = new Regoin();
				regoin.setId(rs.getString(1));
				regoin.setNodeName(rs.getString(3));
				list.add(regoin);
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
	 * ��ȡһ��ʡ�������е���
	 * 
	 * @param provinceId
	 * @return
	 */
	public List<Regoin> getAllCountryByProvinceId(String provinceId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Regoin> list = new ArrayList<Regoin>();
		Regoin regoin = null;
		try {
			con = DBConnection.getConnection();
			String insert = "select t1.id,t1.node_name from t_region t1, t_region t2 "
					+ "where t1.node_type='0' and t1.code_path like concat(t2.code_path,'%') and t2.id=?";
			stmt = con.prepareStatement(insert);
			stmt.setString(1, provinceId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				regoin = new Regoin();
				regoin.setId(rs.getString(1));
				regoin.setNodeName(rs.getString(2));
				list.add(regoin);
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

	public List<Regoin> getAllCountry() {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Regoin> list = new ArrayList<Regoin>();
		Regoin regoin = null;
		try {
			con = DBConnection.getConnection();
			String insert = "select t1.id,t1.node_name from t_region t1 where t1.node_type='0' ";
			stmt = con.prepareStatement(insert);
			rs = stmt.executeQuery();

			while (rs.next()) {
				regoin = new Regoin();
				regoin.setId(rs.getString(1));
				regoin.setNodeName(rs.getString(2));
				list.add(regoin);
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
	 * @���ܣ�����Զ�̽ӿڻ�ȡ�����������ݲ������ڱ������ݿ�
	 * 
	 */
	public int saveAll() {
		// Զ�̵��÷����ȡ������������,���ص���json��ʽ�ַ���
		String jsonData = MetadataServiceUtils.getAreaList();
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		// ��json��ʽ�ַ�������ת��Ϊ���󼯺�,Ȼ�󱣴��ڱ������ݿ���
		List<Regoin> list = g.fromJson(jsonData, new TypeToken<List<Regoin>>() {
		}.getType());
		Connection con = null;
		PreparedStatement stmt = null;
		int count = 0;// ��¼��
		if (list != null)
			count = list.size();
		// ResultSet rs = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String insert = "insert into t_region(id,parent_id,node_name,v_no,node_type,seq_no,national_code,code_path,code_level)"
					+ " values(?,?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(insert);
			String codePath = null;
			BigDecimal codeLevel = null;
			for (Regoin regoin : list) {
				codePath = regoin.getNationalCode().replaceAll("00", "");
				codeLevel = new BigDecimal(codePath.length() / 2);
				stmt.setString(1, regoin.getId());
				stmt.setString(2, regoin.getParentId());
				stmt.setString(3, regoin.getNodeName());
				stmt.setBigDecimal(4, regoin.getVersionNo());
				stmt.setString(5, regoin.getNodeType());
				stmt.setBigDecimal(6, regoin.getSeqNo());
				stmt.setString(7, regoin.getNationalCode());
				stmt.setString(8, codePath);
				stmt.setBigDecimal(9, codeLevel);
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
		return count;
	}

	/**
	 * 
	 * @���ܣ�ɾ�������������е���������
	 * 
	 */
	public void deleteAll() {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = DBConnection.getConnection();
			con.setAutoCommit(false);
			String delete = "delete from t_region";
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

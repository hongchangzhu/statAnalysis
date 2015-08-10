package com.analysis.service;

import java.util.ArrayList;
import java.util.List;

import com.analysis.dao.RegionDaoImpl;
import com.analysis.po.Regoin;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class RegoinServiceImpl {

	/**
	 * 
	 * @���ܣ���ȡĬ����������id
	 * 
	 * @return
	 */
	public String getDefaultRegoinId() {
		RegionDaoImpl daoImpl = new RegionDaoImpl();
		Regoin regoin = daoImpl.getDefaultRegoin();
		if (regoin == null || regoin.getId() == null)
			return "";
		return regoin.getId();
	}

	/**
	 * 
	 * @���ܣ�������������������ݣ���ɾ���ٲ���
	 * 
	 */
	public int updateAll() {
		RegionDaoImpl daoImpl = new RegionDaoImpl();
		// ��ɾ���ٲ���ȫ��
		daoImpl.deleteAll();
		return daoImpl.saveAll();
	}

	/**
	 * 
	 * @���ܣ�����ת��Ϊjson
	 * 
	 * @param pid
	 * @return
	 */
	public String fromObject2Json(String pid) {
		RegionDaoImpl daoImpl = new RegionDaoImpl();
		List<Regoin> list = daoImpl.getUnderline(pid);
		List<Regoin> all = new ArrayList<Regoin>();
		Regoin r = new Regoin();
		r.setId("-1");
		r.setNodeName("ȫ��");
		all.add(r);
		all.addAll(list);
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		String jsonData = g.toJson(list);
		return jsonData;
	}
}

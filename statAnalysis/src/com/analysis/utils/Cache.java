package com.analysis.utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Ӧ��ϵͳ�Զ��建����
 * 
 * @author DELL
 */
@SuppressWarnings("unchecked")
public class Cache extends HashMap{
	private static final long serialVersionUID = 1L;
	private String name;
	private int maxSize;
	public static Cache instance;
	private static Map stat;
	static{
		stat = new HashMap();
		instance = getCache("default", 1000);
	}

	/**
	 * ��ȡ��ǰ��Ӧ��ϵͳ�������
	 * 
	 * @param name
	 *            ����������
	 * @param maxSize
	 *            �������С
	 * @return
	 */
	public static Cache getCache(String name, int maxSize){
		Cache cache = null;
		if(stat.containsKey(name)){
			cache = (Cache) stat.get(name);
		}else{
			cache = new Cache(name, maxSize);
		}
		return cache;
	}

	/**
	 * ���캯��˽�л����Ͻ��ⲿʵ��������
	 * 
	 * @param name
	 * @param i
	 */
	private Cache(String name, int i){
		super();
		this.name = name;
		this.maxSize = i;
	}

	/**
	 * ����Ӧ�û�����������
	 * 
	 * @param key
	 *            ��Ӧ�û�������
	 * @param value
	 *            ����������
	 * @return
	 */
	public Object set(Object key, Object value){
		if(this.size() >= this.maxSize){
			Iterator it = this.keySet().iterator();
			while(it.hasNext() && this.size() >= this.maxSize){
				this.remove(it.next());
				it = this.keySet().iterator();
			}
			it = null;
		}
		return this.put(key, value);
	}
}

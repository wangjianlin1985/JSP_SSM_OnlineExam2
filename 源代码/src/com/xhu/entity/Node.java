package com.xhu.entity;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Node {

	
	@Override
	public String toString() {
		return "Node [id=" + id + ", text=" + text + ", state=" + state + ", p_method=" + p_method + ", checked="
				+ checked + ", children=" + children + ", parentId=" + parentId + "]";
	}
	//�ڵ�� id
	private Integer id;
	//��ʾ�Ľڵ����֡�
	private String text;
	//�ڵ�״̬�� 'open' �� 'closed'��Ĭ���� 'open'
	private String state;
	private String p_method;

	//ָʾ�ڵ��Ƿ�ѡ��
	private boolean checked;
	//������һЩ�ӽڵ�Ľڵ�����
	private List<Node> children;
	//���ڵ�
	private Integer parentId;
	
	/**
	 * ע�⣺��Ҫ�ڹ��캯�������ӽڵ����
	 */
	public Node(){
		this.children = new ArrayList<Node>(); 
	}
	
	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public List<Node> getChildren() {
		return children;
	}
	public void setChildren(List<Node> children) {
		this.children = children;
	}
}

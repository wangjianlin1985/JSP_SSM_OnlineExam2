package com.xhu.util;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.xhu.entity.Node;





/**
 * ���õݹ�ķ�ʽ�����������ݽṹ
 * ���ߣ� ���
 * ����������
 */
@Component
public class Tree {
	/**
	 * ������
	 * @param list ��Ҫ��ת��������
	 * @return ����ת���ɹ�����������
	 */
	public List<Node> createTree(LinkedList<Node> list){
		//poll�����������Ƴ����б��ͷԪ�ز��ҷ����б��ͷԪ��
		Node n = list.poll();
		//����һ���µļ�����������������
		LinkedList<Node> newList = new LinkedList<Node>();
		/**
		 * �������ϣ�����˽ڵ����ӽڵ㣬����ӵ������ӽڵ㼯����
		 */
		for(Node node:list){
			if(node.getParentId()==n.getId()){
				n.getChildren().add(node);
			}
		}
		//�ѽڵ���ӵ��¼�����ȥ
		newList.add(n);
		if(list.size()>0){
			createTree(list);
		}
		
		return newList;
	
	}
/*	
	public static void main(String args[]){
		
		LinkedList<Node> list = new LinkedList<Node>();
		
		Node one = new Node();
		one.setId(0);
		one.setParentId(null);
		one.setText("��");
		list.add(one);
		
		
		Node four = new Node();
		four.setId(3);
		four.setParentId(2);
		four.setText("�Ծ�����");
		list.add(four);
		
		Node two = new Node();
		two.setId(1);
		two.setParentId(0);
		two.setText("�ɼ�����");
		list.add(two);
		
		Node three = new Node();
		three.setId(2);
		three.setParentId(0);
		three.setText("�Ծ����");
		list.add(three);

		
		List<Node> ll =createTree(list);
		
		System.out.println(JSON.toJSONString(ll));
	}*/
	
}

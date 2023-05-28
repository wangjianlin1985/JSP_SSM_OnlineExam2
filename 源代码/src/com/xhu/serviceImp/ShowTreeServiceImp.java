package com.xhu.serviceImp;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xhu.dao.DistributePermMapper;
import com.xhu.entity.Node;
import com.xhu.entity.Permission;
import com.xhu.entity.User;
import com.xhu.service.ShowTreeService;
import com.xhu.util.Tree;

@Service
public class ShowTreeServiceImp implements ShowTreeService {
	@Autowired
	private DistributePermMapper mapper;
	@Autowired
	private Tree tree;

	@Override
	public List<Node> createPerTree() {
		LinkedList<Node> list = mapper.searchPer();
		return tree.createTree(list);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW,
			// 遇到以下异常不回滚noRollbackFor={StockException.class,AccountException.class}
			timeout = 2// 超过时间，事务强制回滚
	)
	public int insert(String[] ss, String name) {
		List<String> list = mapper.selectP(name);
		String[] a = new String[list.size()];
		for (int i = 0; i < list.size(); i++) {
			a[i] = list.get(i);
		}
		int r = 0;
		for (int j = 0; j < ss.length; j++) {
			for (int i = 0; i < a.length; i++) {
				if (ss[j].equals(a[i])) {
					r = 0;
					return r;
				}
			}
		}
		for (int j = 0; j < ss.length; j++) {
			mapper.insert(ss[j], name);
			r++;
		}
		return r;
	}

	@Override
	public HashMap<String, Object> selectUser(User s) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		s.setPage(s.getRows() * (s.getPage() - 1));
		map.put("total", mapper.searchCount(s));
		map.put("rows", mapper.selectUser(s));
		return map;
	}

	@Override
	public int saverole(String username, int rolename) {
		return mapper.saverole(username, rolename);
	}

	@Override
	public int addpermission(Permission p) {
		
		return mapper.addpermission(p);
	}

	@Override
	public int sss() {
		
		return mapper.sss();
	}
}

package com.xhu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xhu.entity.Shortanswer;
import com.xhu.entity.Texam;

public interface TexamMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Texam record);

	int insertSelective(Texam record);

	Texam selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Texam record);

	int updateByPrimaryKey(Texam record);

	Texam selectpaperid(@Param("stuid") String stuid,@Param("papername")String name);

	// �������𰸺Ϳ͹��������ѧ�Ŵ�����ݿ�
	int insertShortAnswer(@Param("stuid") String stuid, @Param("shortanswer") String shortnswer,
			@Param("score") int score, @Param("stuname") String stuname, @Param("papername") String papername);
	//���¿���״̬
	int updateExamStatu(@Param("stuid")String stuid,@Param("name")String papername);
	//�����ܷ�
	int updateAllscore(@Param("score")int score ,@Param("stuid")String stuid,@Param("papername")String papername);
	
	//
    /**
     * ��ҳ��ѯ(����)
     * @param e
     * @return
     */
    List<Texam> searchExam(Texam e);
    /**
     * ��ѯ������
     * @param e
     * @return
     */
    int  searchCount(Texam e);

    /**
     * ��ҳ��ѯ(����)
     * @param e
     * @return
     */
    List<Texam> searchExam2(Texam e);
    /**
     * ��ѯ������
     * @param e
     * @return
     */
    int  searchCount2(Texam e);
    /**
     * ɾ��
     * @param list
     * @return
     */
    int delBat(Texam e);
    //�޸�
   int updateExam(Texam e);
   //����ѧ��id���Ծ�id����
   List<Texam> rechecking(Texam e);
}
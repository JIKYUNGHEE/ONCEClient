package once.item.dao;

import java.util.List;
import java.util.Map;

import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;
import once.item.vo.ItemVO;

public interface ItemDAO {

	List<ItemVO> selectStoreMainItem(String storeNo);

  List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem);

	List<ItemVO> selectItemList();

	List<ItemVO> selectItemList2();

	List<ItemVO> selectItemList3();

	List<ItemVO> selectItemList4();

	List<ItemVO> selectMenItemList();

	List<ItemVO> selectMenItemList2();

	List<ItemVO> selectMenItemList3();

	List<ItemVO> selectMenItemList4();

	List<ItemVO> selectWomenItemList();

	List<ItemVO> selectWomenItemList2();

	List<ItemVO> selectWomenItemList3();

	List<ItemVO> selectWomenItemList4();

	List<ItemVO> selectKidItemList();

	List<ItemVO> selectKidItemList2();

	List<ItemVO> selectKidItemList3();

	List<ItemVO> selectKidItemList4();

	ItemContentsVO selectOneItem(int num);

	String selectByStoreNo(String storeNo);

	List<ItemImgVO> selectByNum(int num);

	String[] getColorList(int num);

	String[] getSizeList(int num);

	//경희 거
/*
	ItemVO getItem(int num);
*/

}

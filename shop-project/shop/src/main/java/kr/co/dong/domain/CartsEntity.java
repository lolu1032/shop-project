package kr.co.dong.domain;

public class CartsEntity {
	// 카트 상품아이디 외래키
	private String goods_id;
	private int users_id;

	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	
}

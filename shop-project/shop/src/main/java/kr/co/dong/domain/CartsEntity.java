package kr.co.dong.domain;

public class CartsEntity {
	private int id;

	// īƮ ��ǰ���̵� �ܷ�Ű
	private String goods_id;
	private String username;

	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	
}

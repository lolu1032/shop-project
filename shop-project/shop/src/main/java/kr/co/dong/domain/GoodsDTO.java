package kr.co.dong.domain;

public class GoodsDTO {
	private String name; // �� �̸�
	private int price; // ���� 
	private String colorType; // �� ��
	private int discount_price; // ���ΰ���
	private String goodsType; // �� ����

//	���� ����
	private String path;
	private int id;
//	�귣��
	private String brandName;
// 	īƮ ��������
	private String username;
	private int cartsId;
	private int count; // ��ǰ�� �ߺ��Ȱ� ī��Ʈ ���ִ� ģ��
	
	
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCartsId() {
		return cartsId;
	}
	public void setCartsId(int cartsId) {
		this.cartsId = cartsId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getColorType() {
		return colorType;
	}
	public void setColorType(String colorType) {
		this.colorType = colorType;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}

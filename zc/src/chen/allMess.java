package chen;

public class allMess {
	private String orderNum;
	private String testTypeId;
	private String price;
	private String state;
	private String time;
	private int id;
	private int sl;
	private String name;
	private String email;
	private String mobile;
	private String company;
	private String qw;
	
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getQw() {
		return qw;
	}
	public void setQw(String qw) {
		this.qw = qw;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getTestTypeId() {
		return testTypeId;
	}
	public void setTestTypeId(String testTypeId) {
		this.testTypeId = testTypeId;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "allMess [orderNum=" + orderNum + ", testTypeId=" + testTypeId
				+ ", price=" + price + ", state=" + state + ", time=" + time
				+ ", id=" + id + ", sl=" + sl + ", name=" + name + ", email="
				+ email + ", mobile=" + mobile + ", company=" + company
				+ ", qw=" + qw + "]";
	}
	
}

package chen;

public class orderDetail {
	private String serveName;
	private String servePrice;
	private String payState;
	private String orderNum;
	private String time;
	private int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getServeName() {
		return serveName;
	}
	public void setServeName(String serveName) {
		this.serveName = serveName;
	}
	public String getServePrice() {
		return servePrice;
	}
	public void setServePrice(String servePrice) {
		this.servePrice = servePrice;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}

}

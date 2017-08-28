package demo;

public class message {
		private int message_id;
		private String title;
		private String gmt_create;
		private String type;
		private String state;
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public int getMessage_id() {
			return message_id;
		}
		public void setMessage_id(int message_id) {
			this.message_id = message_id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getGmt_create() {
			return gmt_create;
		}
		public void setGmt_create(String gmt_create) {
			this.gmt_create = gmt_create;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
}

package demo;

public class applist {
	private int	ID;
	private String Name;
	private String upTime;
	private String size;
	private String kind;
	private String version;
	private String packName;
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	public String getName() {
		return Name;
	}
	public void setTime(String upTime) {
		this.upTime = upTime;
	}
	public String getTime() {
		return upTime;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getPackName() {
		return packName;
	}
	public void setPackName(String packName) {
		this.packName = packName;
	}
	
}

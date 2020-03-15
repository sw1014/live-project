package pojo;

public class User {

    private String Name;
    private String IDNum;
    private String Phone;
    private String MaskNum;
    

    public String getIDNum() {
		return IDNum;
	}

	public void setIDNum(String IDNum) {
		this.IDNum = IDNum;
	}

	public String getName() {
		return Name;
	}

	public void setName(String Name) {
		this.Name = Name;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String Phone) {
		this.Phone = Phone;
	}

	public String getMaskNum() {
		return MaskNum;
	}

	public void setMaskNum(String MaskNum) {
		this.MaskNum = MaskNum;
	}
	
	public String getAnonymousName() {
        if (null == Name)
            return null;

        if (Name.length() <= 1)
            return "*";

        if (Name.length() == 2)
            return Name.substring(0, 1) + "*";

        char[] categories = Name.toCharArray();
        for (int i = 1; i < categories.length - 1; i++) {
            categories[i] = '*';
        }
        return new String(categories);


    }

}

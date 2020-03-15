package pojo;

public class User {

    private String name;
    private String id;
    private String phone;
    private String number;
    

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getAnonymousName() {
        if (null == name)
            return null;

        if (name.length() <= 1)
            return "*";

        if (name.length() == 2)
            return name.substring(0, 1) + "*";

        char[] categories = name.toCharArray();
        for (int i = 1; i < categories.length - 1; i++) {
            categories[i] = '*';
        }
        return new String(categories);


    }

}

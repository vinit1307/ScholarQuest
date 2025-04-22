package servlets;

public class Scholarship {
    private int id;
    private String name;
    private String provider;
    private String lastDate;
    private String category;
    private String amount;
    private String age;
    private String annualIncome;
    private String caste;
    private String eligibility;
    private String documentsRequired;
    private String officialLink;

    // Constructor with minimal parameters
    public Scholarship(int id, String name, String provider, String lastDate, String category) {
        this.id = id;
        this.name = name;
        this.provider = provider;
        this.lastDate = lastDate;
        this.category = category;
        this.amount = "";
        this.age = "";
        this.annualIncome = "";
        this.caste = "";
        this.eligibility = "";
        this.documentsRequired = "";
        this.officialLink = "";
    }

    // Constructor with all parameters
    public Scholarship(int id, String name, String provider,String category, String lastDate ,
                       String amount, String age, String annualIncome, String caste,
                       String eligibility, String documentsRequired, String officialLink) {
        this.id = id;
        this.name = name;
        this.provider = provider;
        this.category = category;
        this.lastDate = lastDate;
        this.amount = amount;
        this.age = age;
        this.annualIncome = annualIncome;
        this.caste = caste;
        this.eligibility = eligibility;
        this.documentsRequired = documentsRequired;
        this.officialLink = officialLink;
    }

    // Getters and Setters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getProvider() { return provider; }
    public String getLastDate() { return lastDate; }
    public String getCategory() { return category; }
    public String getAmount() { return amount; }
    public String getAge() { return age; }
    public String getAnnualIncome() { return annualIncome; }
    public String getCaste() { return caste; }
    public String getEligibility() { return eligibility; }
    public String getDocumentsRequired() { return documentsRequired; }
    public String getOfficialLink() { return officialLink; }

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setAnnualIncome(String annualIncome) {
		this.annualIncome = annualIncome;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}

	public void setDocumentsRequired(String documentsRequired) {
		this.documentsRequired = documentsRequired;
	}

	public void setOfficialLink(String officialLink) {
		this.officialLink = officialLink;
	}
    
}

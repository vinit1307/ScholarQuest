package servlets;


public class Scholarship {
    private int id;
    private String name;
    private String provider;
    private String lastDate;
    private String category;

    // Constructor
    public Scholarship(int id, String name, String provider, String lastDate, String category) {
        this.id = id;
        this.name = name;
        this.provider = provider;
        this.lastDate = lastDate;
        this.category = category;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getProvider() { return provider; }
    public String getLastDate() { return lastDate; }
    public String getCategory() { return category; }
}

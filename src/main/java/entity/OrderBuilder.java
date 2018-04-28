package entity;


public class OrderBuilder implements Builder {
    private String pointOfDeparture;
    private String destination;
    private float cost;
    private String customerName;
    private String phoneNumber;
    private String comment;
    private String typeOfMachine;
    private String addRequirement;

    public OrderBuilder comment(String comment_) {
        comment = comment_;
        return this;
    }

    public OrderBuilder addRequirement(String addRequirement_) {
        addRequirement = addRequirement_;
        return this;
    }

    public OrderBuilder typeOfMachine(String typeOfMachine_) {
        typeOfMachine = typeOfMachine_;
        return this;
    }

    public OrderBuilder phoneNumber(String phoneNumber_) {
        phoneNumber = phoneNumber_;
        return this;
    }

    public OrderBuilder customerName(String customerName_) {
        customerName = customerName_;
        return this;
    }

    public OrderBuilder departure(String pointOfDeparture_) {
        pointOfDeparture = pointOfDeparture_;
        return this;
    }

    public String getPointOfDeparture() {
        return pointOfDeparture;
    }

    public String getDestination() {
        return destination;
    }

    public float getCost() {
        return cost;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getComment() {
        return comment;
    }

    public String getTypeOfMachine() {
        return typeOfMachine;
    }

    public String getAddRequirement() {
        return addRequirement;
    }

    public OrderBuilder destination(String destination_) {
        destination = destination_;
        return this;

    }

    public OrderBuilder cost(Float cost_) {
        cost = cost_;
        return this;
    }

    public Order build() {
        return new Order(this);
    }
}

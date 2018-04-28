package entity;

public class Order {
    private final String pointOfDeparture;
    private final String destination;
    private final float cost;
    private final String customerName;
    private final String phoneNumber;
    private final String comment;
    private final String typeOfMachine;
    private final String addRequirement;

    Order(OrderBuilder b) {
        pointOfDeparture = b.getPointOfDeparture();
        destination = b.getDestination();
        cost = b.getCost();
        customerName = b.getCustomerName();
        phoneNumber = b.getPhoneNumber();
        comment = b.getComment();
        typeOfMachine = b.getTypeOfMachine();
        addRequirement = b.getAddRequirement();
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

    @Override
    public String toString() {
        return "Order{" +
                "pointOfDeparture='" + pointOfDeparture + '\'' +
                ", destination='" + destination + '\'' +
                ", cost=" + cost +
                ", customerName='" + customerName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", comment='" + comment + '\'' +
                ", typeOfMachine='" + typeOfMachine + '\'' +
                ", addRequirements='" + addRequirement + '\'' +
                '}';
    }
}

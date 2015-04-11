package nasacropalert

class Crop {
    String cropName
    String disease
    String pesticide
    String location
    String affected
    Date startDate
    byte[] image
    String description
    static constraints = {
        image(maxSize: 904800)
    }
}

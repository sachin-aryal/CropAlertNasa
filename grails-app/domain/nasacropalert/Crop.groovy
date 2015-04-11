package nasacropalert

class Crop {
    String cropName
    String disease
    String pesticide
    String location
    String affected
    String improve
    Date startDate
    byte[] image
    String description
    static belongsTo = ['user':User]
    static constraints = {
        image(maxSize: 904800)
    }
}

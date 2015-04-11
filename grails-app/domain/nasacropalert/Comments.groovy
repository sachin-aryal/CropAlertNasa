package nasacropalert

class Comments {
    String comments
    String commentator
    static belongsTo = ['crop':Crop,'user':User]
    static constraints = {
    }
}

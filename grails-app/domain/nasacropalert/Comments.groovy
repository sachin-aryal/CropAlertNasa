package nasacropalert

class Comments {
    String comments
    static belongsTo = ['crop':Crop]
    static constraints = {
    }
}

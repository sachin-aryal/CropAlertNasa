package nasacropalert

class User {
    String name
    String emailAddress
    String country
    String phoneNo
    String userName
    String password
    static hasMany = ['crop':Crop]
    static constraints = {
    }
}

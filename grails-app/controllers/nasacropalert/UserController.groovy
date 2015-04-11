package nasacropalert

class UserController {

    def index() {
    }

   def login(){
    }
    def loginValidator(){
        def user=User.findByUserNameAndPassword(params.userName,params.password)
        if(user){
            println("user id"+user.id)
            session.setAttribute("userId",user.id)
            session.setAttribute("userName",user.userName)
            redirect(controller: 'crop', action: 'create')
        }else{
            render view:'index',model:['popUp',"login"]
        }
    }
    def signUp(){

    }
    def register(){
        String name=params.name
        String email=params.email
        String country=params.country
        String phone=params.phone
        String userName=params.userName
        String password=params.password
        if(User.findByUserName(userName)){
            flash.message="Username Already Exits"
            redirect(view: 'index',model:['popUp',"register"])
        }else if(User.findByEmailAddress(email)){
            flash.message="Email Already Exits"
            redirect(view: 'index',model:['popUp',"register"])
        }
        else{
            def user=new User()
            user.name=name
            user.emailAddress=email
            user.setPhoneNo(phone)
            user.setCountry(country)
            user.userName=userName
            user.password=password
            if (!user.save(flush: true)) {
                println "Creating New user"
                /*render(view: "create", model: [user: user])*/
                render(controller:'crop', action:'viewData')
                return
            }
            render view:'index',model:['popUp',"login"]
        }

    }
    def userHomePage(){

    }
}

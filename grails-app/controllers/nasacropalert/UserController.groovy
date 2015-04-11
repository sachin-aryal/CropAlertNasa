package nasacropalert

class UserController {

    def index() {
    }
    def loginValidator(){
        def user=User.findByUserNameAndPassword(params.userName,params.password)
        if(user){
            session.setAttribute("userId",user.id)
            session.setAttribute("userName",user.userName)
            redirect(action: 'userHomePage')
        }else{
            render view:'index',model:['popUp',"login"]
        }
    }
    def register(){
        String name=params.name
        String country=params.country
        String phoneNo=params.phoneNo
        String userName=params.userName
        String password=params.password
        String emailAddress=params.emailAddress
        if(User.findByUserName(userName)){
            flash.message="Username Already Exits"
            redirect(view: 'index',model:['popUp',"register"])
        }else if(User.findByEmailAddress(emailAddress)){
            flash.message="Email Already Exits"
            redirect(view: 'index',model:['popUp',"register"])
        }
        else{
            def user=new User()
            user.name=name
            user.setPhoneNo(phoneNo)
            user.setCountry(country)
            user.emailAddress=emailAddress
            user.userName=userName
            user.password=password
            if (!user.save(flush: true)) {
                println "Creating New user"
                render(view: "create", model: [user: user])
                return
            }
            render view:'index',model:['popUp',"login"]
        }

    }
    def userHomePage(){
    }
}

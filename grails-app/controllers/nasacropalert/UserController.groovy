package nasacropalert

class UserController {

    def index() {
    }

   def login(){
    }
    def loginValidator(){
        String userName=params.userName
        String password=params.password
        def user=User.findByUserNameAndPassword(params.userName,params.password)
        if(user){
            session.setAttribute("userId",user.id)
            session.setAttribute("userName",user.userName)
            redirect(action: 'userDashboard')
        }else if(userName.equalsIgnoreCase("admin")&&password.equalsIgnoreCase("admin")){
            session.setAttribute("Role","admin")
            session.setAttribute("userName","Admin")
            redirect(action: 'adminDashboard')
        }
        else{
            flash.message="Invalid Username and Password do not match!!"
            render view:'login'
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
            render(view: 'index')
        }else if(User.findByEmailAddress(email)){
            flash.message="Email Already Exits"
            render(view: 'index')
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
                flash.message="!sorry something went wrong"
                render(view: "create")
                return
            }
            render view:'login'
        }

    }
    def userDashboard(){

    }
    def adminDashboard(){

    }
    def logout(){
        session.setAttribute("userId",null)
        session.setAttribute("userName",null)
        redirect(action: 'index')
    }
}

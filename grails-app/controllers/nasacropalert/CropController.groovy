package nasacropalert

class CropController {

    def index() {

    }
    def getData(Integer max){
        params.max = Math.min(max ?: 10, 1000)
        def ActionName=params.Action
        def cropDetail
        if(session.getAttribute("userId")){
            render view:'viewData',model:[ActionName:ActionName,cropDetail:cropDetail=Crop.findByUser(User.findAllById(session.getAttribute("userId"),params),cropDetailTotal: Crop.findByUser(User.findAllById(session.getAttribute("userId")).size()))]
        }else{
            render view:'viewData',model:[ActionName:ActionName,cropDetail:cropDetail=Crop.list(params),CropDetailTotal:Crop.list().size()]
        }
        }

}

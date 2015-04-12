package nasacropalert


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)


class CropController {
    def show(Long id) {
        def cropInstance = Crop.get(id)
        def userTrue = false
        def validateUser = cropInstance?.userId
        def userId = session.getAttribute("userId")
        if(userId==validateUser){
            userTrue=true
        }
        def comments=new Comments()
        comments=Comments.findAllByCrop(Crop.findById(id))
        [cropInstance:cropInstance,userTrue: userTrue,comments:comments]
    }
    def getData(Integer max){
        params.max = Math.min(max ?: 10, 1000)
        def ActionName=params.Action
        def cropDetail = Crop.all
        def cropDetailTotal = cropDetail.size()
        def userTrue=false
        if(session.getAttribute("userId")){
            userTrue=true
            render view:'viewData',model:[userTrue: userTrue, ActionName:ActionName,cropDetail:cropDetail,cropDetailTotal:cropDetailTotal]
        }else{
            userTrue=false
            render view:'viewData',model:[userTrue: userTrue,ActionName:ActionName,cropDetail:cropDetail,cropDetailTotal:cropDetailTotal]
        }
    }
    def create() {
        respond new Crop(params)
    }
    def imageShow(){
        def imageInstance = Crop.get(params.id)
        response.outputStream<<imageInstance.image
        response.outputStream.flush()
    }

    @Transactional
    def save(Crop cropInstance) {
        if (cropInstance == null) {
            notFound()
            return
        }

        if (cropInstance.hasErrors()) {
            respond cropInstance.errors, view: 'create'
            return
        }

        cropInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cropInstance.label', default: 'Crop'), cropInstance.id])
                redirect cropInstance
            }
            '*' { respond cropInstance, [status: CREATED] }
        }
    }

    def edit(Crop cropInstance) {
        respond cropInstance
    }

    @Transactional
    def update(Crop cropInstance) {
        println "Request getting here"
        if (cropInstance == null) {
            notFound()
            return
        }

        if (cropInstance.hasErrors()) {
            println "Edit has error"
            respond cropInstance.errors, view: 'edit'
            return
        }

        cropInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Crop.label', default: 'Crop'), cropInstance.id])
                redirect cropInstance
            }
            '*' { respond cropInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Crop cropInstance) {

        if (cropInstance == null) {
            notFound()
            return
        }

        cropInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Crop.label', default: 'Crop'), cropInstance.id])
                redirect action: 'getData',params: [ActionName: "table"]
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cropInstance.label', default: 'Crop'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


}

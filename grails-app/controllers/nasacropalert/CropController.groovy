package nasacropalert


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)


class CropController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Crop.list(params), model: [cropInstanceCount: Crop.count()]
    }

    def show(Crop cropInstance) {
        respond cropInstance
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
    def create() {
        respond new Crop(params)
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
        if (cropInstance == null) {
            notFound()
            return
        }

        if (cropInstance.hasErrors()) {
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
                redirect action: "index", method: "GET"
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

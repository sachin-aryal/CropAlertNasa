package nasacropalert

class CommentsController {
        def save(){
                String comment=params.comment
                String commentator=params.commentator
                def comments=new Comments()
                comments.comments=comment
                comments.commentator=commentator
                if(commentator.equalsIgnoreCase("admin")){
                        comments.user=User.findById(4)
                }else if(commentator.equalsIgnoreCase("Anonymous")){
                        comments.user=User.findById(1)
                }else{
                        comments.user=User.findByUserName(commentator)
                }
                comments.crop=Crop.findById(params.cropId)
                comments.save(flush: true)
                def cropInstance = Crop.get(params.cropId)
                def userTrue = false
                def validateUser = cropInstance?.userId
                def userId = session.getAttribute("userId")
                if(userId==validateUser){
                        userTrue=true
                }
                comments=Comments.findAllByCrop(Crop.findById(params.cropId))
                render view:'/crop/show',model: [cropInstance:cropInstance,userTrue: userTrue,comments:comments]

        }

}

package nasacropalert

class CommentsController {
        def save(){
                String comment=params.comment
                String commentator=params.commentator
                def comments=new Comments()
                comments.comments=comment
                comments.commentator=commentator
                if(commentator.equalsIgnoreCase("admin")){
                        comments.user=User.findByUserName(commentator)
                }else if(commentator.equalsIgnoreCase("Anonymous")){
                        comments.user=User.findById(1)
                }else{
                        comments.user=User.findByUserName(commentator)
                }
                comments.crop=Crop.findById(params.cropId)
                comments.save(flush: true)

        }

}

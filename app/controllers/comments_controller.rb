class CommentsController < ApplicationController
  def new
    @comment=Comment.new
    @entr=Entry.find(params[:entry_id])
  end
    
  
  def create
    @comment	=	Comment.new(comment_params)
				if	@comment.save
				    flash[:success]	=	"Comment Successfully posted!"
						redirect_to :action => 'show',:controller => 'entries', :id => @comment.entry_id
				else
						render	'new'
				end
  end
  private
				def	comment_params
						params.require(:comment).permit(:comment,:entry_id)
				end
end

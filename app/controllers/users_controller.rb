class UsersController < ApplicationController
  def index
    @users = User.all
  end    
  def show
    @user	=	User.find(params[:id])
    @entry=@user.entries.paginate(page: params[:page])
  end  
  def new
    @user	=	User.new
  end
  
  def create
    @user	=	User.new(user_params)
				if	@user.save
				    log_in	@user
				    flash[:success]	=	"Welcome	to	the	Demo	App!"
						redirect_to	@user
				else
						render	'new'
				end
  end
  def	following
				@title	=	"Following"
				@user		=	User.find(params[:id])
				@users	=	@user.following.paginate(page:	params[:page])
				render	'show_follow'
  end
	def	followers
			@title	=	"Followers"
			@user		=	User.find(params[:id])
			@users	=	@user.followers.paginate(page:	params[:page])
			render	'show_follow'
	end

  private
				def	user_params
						params.require(:user).permit(:name,	:email,	:password,	:password_confirmation)
				end
				def	correct_user
						@user	=	User.find(params[:id])
						redirect_to(root_url)	unless	current_user?(@user)
				end
        def	logged_in_user
            unless	logged_in?
								flash[:danger]	=	"Please	log	in."
								redirect_to	login_url
			      end
			  end

				
end

class EntriesController < ApplicationController
	def index
    @entries = Entry.all
  end
  def show
    @entry	=	Entry.find(params[:id])
  end
  def new
    @entry=Entry.new
  end
  def create
    @entry	=	Entry.new(entry_params)
				if	@entry.save
				    flash[:success]	=	"Entry Successfully submitted!"
						redirect_to :action => 'show', :id => @entry.id
				else
						render	'new'
				end
  end
  private
				def	entry_params
						params.require(:entry).permit(:title,:body,:date,:user_id)
				end
end

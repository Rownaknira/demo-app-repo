class EntriesController < ApplicationController
  def new
    @entry=Entry.new
  end
  def create
    @entry	=	@entry	=	Entry.new(entry_params)
				if	@entry.save
				    flash[:success]	=	"Successfully submitted!"
						redirect_to	@entry
				else
						render	'new'
				end
  end
  private
				def	entry_params
						params.require(:entry).permit(:title,:body,:date)
				end
end

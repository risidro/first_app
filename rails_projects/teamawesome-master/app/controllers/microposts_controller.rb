class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
#    @story = Story.find(params[:story_id])
#    @micropost = @story.microposts.build(micropost_params)

#    @micropost = current_user.microposts.build(params[:micropost_params])

#    @micropost = Micropost.new.(params[:micropost])
#    @micropost.story = @story   
#    @micropost.user = current_user


    @micropost = current_user.microposts.build(micropost_params)
#    @micropost.update_attribute(:story_id, @story.id) 

    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to stories_path  
      #can't get it to route to stories/:id/edit -it doesn't know the id 

    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content, :story_id, :user_id)
    end
  
end
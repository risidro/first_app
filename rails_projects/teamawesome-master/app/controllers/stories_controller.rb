class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @microposts = @story.microposts.paginate(page: params[:page])
  end

  # GET /stories/new
  def new
    @story = Story.new
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
#    @micropost = current_user.microposts.build if signed_in?
    @micropost  = @story.microposts.build
    @feed_items = @story.microposts.paginate(page: params[:page])
# line above may not be correct
  end

  # POST /stories
  # POST /stories.json
  def create
#    @story = Story.new(story_params)
    @story = current_user.stories.build(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
#        redirect_to ???
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :category, :micropost, :user_id)
    end
end


class AdPostsController < ApplicationController
  before_action :set_ad_post, only: %i[ show edit update destroy ]

  # GET /ad_posts or /ad_posts.json
  def index
   
    @ad_posts = AdPost.all
  end

  # GET /ad_posts/1 or /ad_posts/1.json
  def show
    @ad_posts= AdPost.includes(:tags).find(params[:id])
    @tags = @ad_posts.tags
 
   
  end

  # GET /ad_posts/new
  def new
    @ad_post = AdPost.new
    @tags = Tag.all

  end

  # GET /ad_posts/1/edit
  def edit
    @tags = Tag.all    
    
  end

  # POST /ad_posts or /ad_posts.json
  def create 
    @temp_params = ad_post_params
    @tags = Tag.all
    @temp_params[:tags] = @temp_params[:tags].map{ |tag_id| @tags.find (tag_id)}

   
    @ad_post =AdPost.new(@temp_params)
    

    respond_to do |format|
      if @ad_post.save
        format.html { redirect_to @ad_post, notice: "Ad post was successfully created." }
        format.json { render :show, status: :created, location: @ad_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ad_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_posts/1 or /ad_posts/1.json
  def update
    @tags = Tag.all
    @temp_params = ad_post_params
    @temp_params[:tags] = @temp_params[:tags].map{ |tag_id| @tags.find (tag_id)}
    respond_to do |format|
      if @ad_post.update(@temp_params)
        format.html { redirect_to @ad_post, notice: "Ad post was successfully updated." }
        format.json { render :show, status: :ok, location: @ad_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ad_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_posts/1 or /ad_posts/1.json
  def destroy
    @ad_post.destroy
    respond_to do |format|
      format.html { redirect_to ad_posts_url, notice: "Ad post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_post
      @ad_post = AdPost.includes(:tags).find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def ad_post_params
      params.require(:ad_post).permit(:title, :description, tags:[],ad_post_tags:[])
    end

   
end


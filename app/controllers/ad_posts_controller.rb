class AdPostsController < ApplicationController
  before_action :set_ad_post, only: %i[ show edit update destroy ]

  # GET /ad_posts or /ad_posts.json
  def index
    @ad_posts = AdPost.all
  end

  # GET /ad_posts/1 or /ad_posts/1.json
  def show
  end

  # GET /ad_posts/new
  def new
    @ad_post = AdPost.new
  end

  # GET /ad_posts/1/edit
  def edit
  end

  # POST /ad_posts or /ad_posts.json
  def create
    @ad_post = AdPost.new(ad_post_params)

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
    respond_to do |format|
      if @ad_post.update(ad_post_params)
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
      @ad_post = AdPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ad_post_params
      params.require(:ad_post).permit(:title, :description)
    end
end

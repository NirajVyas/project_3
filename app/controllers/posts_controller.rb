class PostsController < ApplicationController
  before_filter :load_blog

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.build_video

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

    #   respond_to do |format|
    #   format.html { redirect_to edit_blog_post(params[:blog_id], params[:id]) }
    #   format.json { head :no_content }
    # end

  end

  # POST /posts
  # POST /posts.json
  def create
    images = params[:post].delete(:photo_file) 
    @post = Post.new(params[:post])
    @post.blog = @blog
    respond_to do |format|
      if @post.save
        @post.create_images(images) if images
        format.html { redirect_to @post.blog, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post.blog, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url(params[:blog_id]) }
      format.json { head :no_content }
    end
  end



  private
  def load_blog
    @blog = Blog.find(params[:blog_id])
  end

  def  def create_images

  end

end

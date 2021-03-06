class BlogsController < ApplicationController
  authorize_resource
  # GET /blogs
  # GET /blogs.json
  def index

    @search = Blog.search(params[:q])
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag]).where(public: true)
      else
       @blogs = Blog.where public: true
        respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @blogs }
      end
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show

    @blog = Blog.find(params[:id])
    #@comments = @blog.comment_threads.order('created_at desc')
    #@new_comment = Comment.build_from(@blog, current_user.id, "")

    @blog = Blog.find(params[:id])
    @posts = Post.find_all_by_blog_id(params[:id])
    @count = current_user.blogs.count
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])
    @blog.user = current_user
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  def user_blog
    @search = Blog.search(params[:q])
    @blogs = current_user.blogs
    render action: "index"
  end

  def user_search
    @search = Blog.search(params[:q])
    @blogs = @search.result(:distinct => true)
    render action: "index" 
  end

  def feed
  @title = "Your feed title..."
  
  # all blogposts
  @blogposts = Blog.order("created_at desc")
  
  # update timestamp for the feed
  @updated = @blog.first.updated_at unless @blog.empty?
  
  respond_to do |format|
    format.atom { render :layout => false }
  
    # if you want to permanently redirect to the ATOM feed and do not use the RSS feed
    format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
  end
end

end

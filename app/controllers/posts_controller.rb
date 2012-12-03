class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authenticate_admin!, except: [:index, :show]
  expose(:posts)
  expose(:post)

  def index
    @paginated_posts = Post.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

  def create
    post = Post.new(params["post"])
    post.user = current_user
    unless post.valid?
      flash.now[:error] = params.to_s + post.inspect
      render 'new'
    else
      post.content = mark_text(post.raw_content)
      post.save
      redirect_to post
    end
  end

  def new
    post = Post.new
  end

  def edit
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
  end

  def show
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
  end

  def update

    post = Post.find_by_id(params[:id])
    post.assign_attributes(params[:post])

    if !post.valid?
      flash.now[:error] = params.to_s + post.inspect
      render 'edit'
    elsif !post.admin?
      flash.now[:error] = "Sorry, you must be an admin to update a post."
      redirect_to root_path
    else
      post.content = mark_text(post.raw_content)
      post.save
      redirect_to post
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    redirect_to root_url if post.nil?
    post.delete
    redirect_to root_url
  end

  def preview
    post = params[:content]
    render json: mark_text(post).to_json
  end

  private
  def mark_text(text)
    renderer = HTMLwithAlbino.new(hard_wrap: true)
    options = { 
      autolink: true, 
      no_intra_emphasis:true, 
      fenced_code_blocks: true, 
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text)
  end

  def authenticate_admin!
  if current_user.admin?
    return true
  end
  redirect_to root_url, :notice => "You must be an admin to access this resource."
  return false
end
end

class HTMLwithAlbino < Redcarpet::Render::HTML      
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

class Admin::BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blogs_params)
    if blog.save
      redirect_to new_admin_blog_path, notice: 'ブログを登録しました。'
    else
      render 'new'
    end
  end

  private
  def blogs_params
    params.require(:blog).permit(
      :name, 
      :link, 
      :rss_link,
      :description
    )
  end
end



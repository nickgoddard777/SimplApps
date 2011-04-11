class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.destroy(params[:id])
    redirect_to 'index', :notice => "Successfully deleted page."
  end

  def home
    @title = "SimplApps :: Homepage"
  	@page = Page.find_by_page_type('home')
  	@project = Page.find_by_page_type('project')
  	@blog = Page.find_by_page_type('blog')
  end

  def about
    @title = "SimplApps :: About"
  	@page = Page.find_by_page_type('about')
  	render 'display'
  end

  def contact
    @title = "SimplApps :: Contact"
  	@page = Page.find_by_page_type('contact')
  	render 'display'
  end

  def services
    @title = "SimplApps :: Services"
  	@page = Page.find_by_page_type('services')
  	render 'display'
  end
end


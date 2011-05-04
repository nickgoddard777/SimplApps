require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'


class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:home, :about, :contact, :services, :blog]

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
  	@project = Project.last
  	@blog = blog
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

  private
    def blog

      feed_url = 'http://simplapps.wordpress.com/feed/'
      output = "<h3>Blog</h3>"
      open(feed_url) do |http|
        response = http.read
        result = RSS::Parser.parse(response, false)

        result.items.each_with_index do |item, i|

          output += "<h4><a href=\"#{item.link}\">#{item.title}</a></h4><p>#{item.description}</p>" if i < 10
        end
      end
      blog = output
    end
end


class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end

  # This action can be accessed normally, or as nested pages.
  # Assuming a page named "mission" that is a child of "about",
  # you can access the pages with the following URLs:
  #
  #   GET /pages/about
  #   GET /about
  #
  #   GET /pages/mission
  #   GET /about/mission
  #
  def show

    if !(params[:path] =~ /(.*)web(.*)/) and !(params[:path] =~ /intra/)
      redirect_to "/intra/#{params[:path]}/#{params[:id]}"
    elsif (params[:path] =~ /(.*)web(.*)/) and !(params[:path] =~ /intra/)
      #last = "#{params[:path]}/#{params[:id]}".split('/').last
      redirect_to "/web/#{params[:path]}/#{params[:id]}"
    end

  end

end

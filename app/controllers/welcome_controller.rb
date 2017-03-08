class WelcomeController < ApplicationController
  before_filter :find_side_links
  require 'open-uri'

  def index
    @stories = JSON.load(open("http://sketches.quintype.com/api/v1/stories"))
  end

  private
  def find_side_links
    @side_linkes_json = JSON.load(open("http://sketches.quintype.com/api/v1/config"))
    @side_linkes = @side_linkes_json['layout']['menu']
  end
end
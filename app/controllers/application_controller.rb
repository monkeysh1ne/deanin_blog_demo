class ApplicationController < ActionController::Base
    before_action :set_query
end

def set_query
    @query = Post.ransack(params[:q])
end
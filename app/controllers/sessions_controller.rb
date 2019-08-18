class SessionsController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
    end

    def create
        if params[:name].nil? || params[:name].empty?
            redirect_to login_path
        else
            session[:name] = params[:name]
            redirect_to root_path
        end
    end

    def destroy
        session.delete :name
        redirect_to root_path
    end

    private

    def require_login
        redirect_to login_path unless session.include? :name
    end

end
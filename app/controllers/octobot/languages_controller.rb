module Octobot
  class LanguagesController < BaseController
    include HasLanguages

    before_action :set_language, only: [:show, :edit, :update, :destroy]
    before_action :set_languages, only: [:trends]

    def index
      @languages = Language.all
    end

    def show; end

    def new
      @language = Language.new(active: true)
    end

    def edit; end

    def create
      @language = Language.new(language_params)

      if @language.save
        redirect_to @language, notice: 'Language was successfully created.'
      else
        render :new
      end
    end

    def update
      if @language.update(language_params)
        redirect_to @language, notice: 'Language was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @language.destroy
      redirect_to octobot_languages_url, notice: 'Language was successfully destroyed.'
    end

    def trends
      @trends = Trend.includes(:language).active.where(language: params[:id]).decorate
      render 'octobot/trends/index'
    end

    private

    def set_language
      @language = Octobot::Language.find(params[:id])
    end

    def language_params
      params.require(:octobot_language).permit(:title, :active)
    end
  end
end

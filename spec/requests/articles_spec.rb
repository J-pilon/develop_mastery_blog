require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "works!" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/1" do
    it "responds with article id 1" do
      FactoryBot.create(:article)

      get article_path(5)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/new" do
    it "responds with the articles new form" do
      get new_article_path
      expect(response).to have_http_status(200)
    end
  end
end

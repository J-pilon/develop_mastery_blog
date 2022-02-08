require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before(:all) do
    FactoryBot.create(:article)
    article = Article.find_by(title: "Test Title")
    defined?(article)
  end

  # describe "GET /404" do
  #   it "redirects with status 404" do
  #     get "/asdf"
  #     expect(response).to have_http_status(404)
  #   end
  # end

  describe "GET /articles" do
    it "works!" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/1" do
    it "responds with article id 1" do
    
      get article_path(1)
      expect(response).to have_http_status(200)
    end

    context "if Article isn't found" do
      it "responds with status code 404" do
        get article_path(50)
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "GET /articles/new" do
    it "responds with the articles new form" do
      get new_article_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /articles" do
    it "adds the new article" do
      post "/articles", :params => {:article => {:title => "Article Title", :body => "This is the article body"}}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /articles/5/edit" do
    it "responds with status 200" do
      get "/articles/5/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe "Put /articles/5" do
    it "redirects with status 302" do
      put "/articles/5", :params => {:article => {title: "New Title", body: "New body"}}
      expect(response).to have_http_status(302)
    end
  end

end 

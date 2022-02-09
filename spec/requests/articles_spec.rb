require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before(:all) do
    FactoryBot.create(:article)
  end

  describe "GET /404" do
    it "redirects with status 404" do
      get "/asdf"
      expect(response).to have_http_status(404)
    end
  end

  describe "GET /articles" do
    it "works!" do

      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /articles/1" do
    context "if Article is found" do
      it "responds with article id 1" do
    
        get article_path(1)
        expect(response).to have_http_status(200)
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

  describe "GET /articles/1/edit" do
    it "responds with status 200" do

      get "/articles/1/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe "Put /articles/1" do
    context "successfully updates article" do
      it "redirects with status 302" do

        put "/articles/1", :params => {:article => {title: "New Title", body: "New body"}}
        expect(response).to have_http_status(302)
      end
    end

    context "fails to update article and responses with status 422" do
      it "when title is nil" do

        put "/articles/1", :params => {:article => {title: nil, body: "New body"}}
        expect(response).to have_http_status(422)
      end

      it "when body is nil" do

        put "/articles/1", :params => {:article => {title: "New Title", body: nil}}
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /articles/1" do
    it "reduces articles count by 1" do

      expect{delete "/articles/1"}.to change { Article.count }.by(-1)
    end
  end
end

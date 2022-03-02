require 'rails_helper'

RSpec.describe "Articles", type: :request do

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

  describe "GET /articles/:id" do
    context "if Article is found" do
      let(:article) {FactoryBot.create(:article)}

      it "responds with article" do
    
        get article_path(article)
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
    context "successfully redirects and" do
      it "adds the new article" do

        post "/articles", :params => {:article => {:title => "Article Title", :body => "This is the article body"}}
        expect(response).to have_http_status(302)
      end
    end

    context "fails to redirect because of unprocessable data" do
      it "responds with a status of 422 when title is nil" do

        post "/articles", :params => {:article => {:title => nil, :body => "This is the article body"}}
        expect(response).to have_http_status(422)
      end

      it "responds with a status of 422 when body is nil" do

        post "/articles", :params => {:article => {:title => "Title", :body => nil}}
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET /articles/:id/edit" do
    let(:article) {FactoryBot.create(:article)}

    it "responds with status 200" do

      get "/articles/#{article.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe "Put /articles/:id" do
    context "successfully updates article" do
      let(:article) {FactoryBot.create(:article)}

      it "redirects with status 302" do

        put "/articles/#{article.id}", :params => {:article => {title: "New Title", body: "New body"}}
        expect(response).to have_http_status(302)
      end
    end

    context "fails to update article and responses with status 422" do
      let(:article) {FactoryBot.create(:article)}

      it "when title is nil" do

        put "/articles/#{article.id}", :params => {:article => {title: nil, body: article.body}}
        expect(response).to have_http_status(422)
      end

      it "when body is nil" do

        put "/articles/#{article.id}", :params => {:article => {title: article.title, body: nil}}
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /articles/:id" do
    let!(:article) {FactoryBot.create(:article)}

    it "reduces articles count by 1" do

      expect{delete "/articles/#{article.id}"}.to change { Article.count }.by(-1)
    end
  end
end

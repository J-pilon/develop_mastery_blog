class ArticlesController < ApplicationController
    def index
        pageNumber = permittedParam[:page]&.to_i || 1
        count = Article.count
        itemsPerPage = permittedParam[:items_per_page]&.to_i || 10
        
        if itemsPerPage > 0
            @lastPage = ((count / itemsPerPage) + 1)
        else
            @lastPage = 1
            itemsPerPage = count
        end

        @articles = Article.all.order(created_at: :desc).limit(itemsPerPage)
        
        if (pageNumber < 1 || pageNumber > @lastPage)
            @error = "Invalid page number!"
            render :index 
        else
            pageNumber = (pageNumber - 1)
            @articles.offset(itemsPerPage * pageNumber)
        end
    end

    def show
        @article = Article.find(permittedParam[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(permittedParam[:id])
    end

    def update
        @article = Article.find(permittedParam[:id])

        if @article.update(article_params)
            redirect_to @article 
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(permittedParam[:id])
        @article.destroy

        redirect_to articles_path, status: :see_other
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end

    def permittedParam
        permittedParam = params.permit(:id, :page, :items_per_page)
    end
end
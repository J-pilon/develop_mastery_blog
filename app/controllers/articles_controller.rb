class ArticlesController < ApplicationController
    def index

        if permittedParam[:page] == "0"
            @error = "Invalid page number!"
            @articles = Article.all.order(created_at: :desc)
            @last_page = 1

            return render :index
        end
        
        pag = Pagination.new(
            data: Article.all.order(created_at: :desc), 
            page: permittedParam[:page], 
            items_limit: permittedParam[:items_limit]
        ).return_pagination_params

        @articles = pag[:data]
        @page_number = pag[:page_number]
        @last_page = pag[:last_page] 
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
        permittedParam = params.permit(:id, :page, :items_limit)
    end
end
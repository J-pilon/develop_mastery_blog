class ArticlesController < ApplicationController


    def index
        page_number = permittedParam[:page].to_i
        items_limit = permittedParam[:items_limit] == nil ? 10 : permittedParam[:items_limit].to_i

        if page_number == 0
            @articles = {
                :records => Article.order_data.offset_data, 
                :last_page => 9
            }

            return articles_path(page: 1)
        end

        @articles = {
            :records => Article.order_data.offset_data(limit: items_limit, page: page_number),
            :last_page => Article.last_page(limit: items_limit),
        }
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
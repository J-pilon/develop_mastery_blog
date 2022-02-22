class ArticlesController < ApplicationController

    include Pagination

    def index
        ordered_articles = Article.all.order(created_at: :desc) 
        page_number = permittedParam[:page].to_i
        items_limit = permittedParam[:items_limit] == nil ? 10 : permittedParam[:items_limit]

        if page_number == 0
            @articles = ordered_articles.limit(10)
            @last_page = 9

            return articles_path(page: 1)
        end

        paginated = return_pagination_params(items_limit: items_limit.to_i, data: ordered_articles, page_number: page_number)

        @articles = paginated[:paginated_data]
        @page_number = paginated[:page_number]
        @last_page = paginated[:last_page]
    end

    def show
        @article = Article.sluggable.find(permittedParam[:id])
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
        @article = Article.sluggable.find(permittedParam[:id])
    end

    def update
        @article = Article.sluggable.find(permittedParam[:id])

        if @article.update(article_params)
            redirect_to @article 
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.sluggable.find(permittedParam[:id])
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
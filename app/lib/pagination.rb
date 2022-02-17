class Pagination

    attr_reader :data, :page, :items_limit

    def initialize(data:, page:, items_limit: 10)
        @data = data
        @page = page.to_i
        @items_limit = items_limit.to_i
    end

    def page_number
        page - 1
    end

    def last_page
        if items_limit == nil || items_limit < 1
            lastPage = 1
        else
            lastPage = data.count / items_limit
        end
    end

    def return_pagination_params
        if items_limit == nil || items_limit == 0
            paginated_data = data
        else
            paginated_data = return_offset_data
        end

        {:page_number => page_number, :last_page => last_page, :data => paginated_data}
    end

    private

    def apply_limit_to_data
        data.limit(items_limit)
    end

    def return_offset_data
        apply_limit_to_data.offset(items_limit * page_number)
    end
end
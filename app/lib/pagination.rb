module Pagination

    def return_pagination_params(items_limit:, data:, page_number:)
        last_page = last_page(total_items_count: data.count, items_limit: items_limit)
        paginated_data = items_limit == 0 ? data : return_data_subset(data: data, items_limit: items_limit, page_number: page_number)

        {:paginated_data => paginated_data, :page_number => page_number, last_page: last_page}
    end

    private

    def last_page(total_items_count:, items_limit:)
        last_page = items_limit < 1 ? 1 : (total_items_count / items_limit)
    end

    def return_data_subset(data:, items_limit:, page_number:)
        data.limit(items_limit).offset(items_limit * (page_number - 1))
    end
end
# Controller methods for doing pagination.
module ControllerPaging
  extend ActiveSupport::Concern

  # @param collection [Neo4j::ActiveNode::Query::QueryProxy]
  # @param default_sort_by [Symbol, String]
  # @return [Neo4j::ActiveNode::Query::QueryProxy]
  def paginate(collection, default_sort_by: nil)
    sort_by = page_params[:order] || default_sort_by

    collection.order(sort_by => page_params[:order_dir]).
      page(page_params[:page]).per(page_params[:per_page])
  end

  def page_params
    paging = params.permit(:page, :per_page, :order, :order_dir)

    paging[:page] = paging.fetch(:page, 1).to_i
    paging[:per_page] = paging.fetch(:per_page, 25).to_i
    paging[:order_dir] ||= :asc
    Rails.logger.debug "#{paging[:page]}, #{paging[:per_page]}, #{paging[:order]}, #{paging[:order_dir]}"

    paging
  end
end

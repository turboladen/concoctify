class ApplicationController < ActionController::API
  rescue_from Neo4j::RecordNotFound do |_exception|
    message = 'Unable to find record'
    title = 'Record not found'

    render json: custom_error(title, message, 404), status: :not_found
  end

  private

  def data_params
    params.require(:data)
  end

  def custom_error(title, message, status_code)
    {
      errors: [{
        title: title,
        detail: message,
        status: status_code.to_s
      }]
    }.to_json
  end
end

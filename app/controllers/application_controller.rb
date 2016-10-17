class ApplicationController < ActionController::API
  include Authenticatable
  include ErrorSerializer

  before_action :authenticate_user!

  private

  def jsonapi_parse(params, values)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, values)
  end

  def extract_meta(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  def render_response(klass, interaction_params={}, render_options={})
    interaction_response = klass.run(interaction_params)
    response, status = interaction_response.handler
    result = {json: response, status: status}
    meta = case render_options[:meta]
               when 'base'
                 extract_meta(response)
               when 'custom'
                 interaction_response.meta
             end
    render_options.merge!(meta: meta) if meta.present?
    if status == :ok
      render result.merge(render_options)
    else
      result[:json] = ErrorSerializer.serialize(result[:json].as_json, result[:status])
      render result
    end
  end

  def record_not_found(exception)
    render json: ErrorSerializer.serialize({errors: [exception]}, :unprocessable_entity), status: :unprocessable_entity
  end
end

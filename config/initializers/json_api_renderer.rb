ActionController.add_renderer :json_api do |js, _options|
  self.content_type ||= Concoctify::JSON_API_MIME
  ActiveModel::SerializableResource.new(js).serializable_hash.to_json
end

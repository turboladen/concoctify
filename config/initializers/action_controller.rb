require 'action_controller/metal/renderers'

ActionController::Renderers.add(:json_api) do |content, options|
  self.content_type ||= Mime[:json_api]

  ActiveModel::SerializableResource.new(content).serializable_hash.to_json
end

ActiveModelSerializers.config.adapter = :json_api
ActiveModel::Serializer.config.key_transform = :unaltered

api_mime_types = %W(
  application/vnd.api+json
  text/x-json
  application/json
)

Mime::Type.register 'application/vnd.api+json', :json, api_mime_types

json.merge! @pill.attributes.reject { |k| k.eql?('image_path') }
json.image_path do
  json.url @pill.image_path.url
end
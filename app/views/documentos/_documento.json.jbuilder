json.extract! documento, :id, :descripcion, :correlativo, :presento, :observaciones, :created_at, :updated_at
json.url documento_url(documento, format: :json)

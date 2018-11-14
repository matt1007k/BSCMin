json.extract! ficha, :id, :indicator_id, :unidad, :tiempo, :meta, :verde, :amarillo, :rojo, :created_at, :updated_at
json.url ficha_url(ficha, format: :json)

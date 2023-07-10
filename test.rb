require 'json'
require 'json-schema'

# Chemin du fichier JSON
json_file_path = 'generated.json'

# Chemin du fichier JSON Schema
json_schema_path = 'schema.json'

# Charger le fichier JSON
json_data = JSON.parse(File.read(json_file_path))

# Charger le fichier JSON Schema
json_schema = JSON.parse(File.read(json_schema_path))

# Mesurer le temps de validation
start_time = Time.now
valid = JSON::Validator.validate(json_schema, json_data)
end_time = Time.now
validation_time = end_time - start_time

# Vérifier si la validation a réussi
if valid
  puts "Le fichier JSON est valide selon le schéma."
else
  puts "Le fichier JSON n'est pas valide selon le schéma."
end

puts "Temps de validation : #{validation_time} secondes."

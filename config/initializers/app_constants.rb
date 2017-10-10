EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
ZIP_REGEX = /[A-Y]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}/
PROVINCE_CITIES = YAML.load_file(::Rails.root.join('lib', 'cities.yml'))
PROVINCES = PROVINCE_CITIES.keys
CITIES = PROVINCE_CITIES.values.flatten.uniq


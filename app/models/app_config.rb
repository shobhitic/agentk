class AppConfig < ApplicationRecord
  enum data_type: { string: 'string', integer: 'integer', boolean: 'boolean' }
end

module API
  module V1
    class Root < Grape::API
      error_formatter :json, API::V1::ErrorFormatter
      mount API::V1::Ideas
      mount API::V1::Projects
      mount API::V1::Users
    end
  end
end

require 'doorkeeper/grape/helpers'


module API
  class Root < Grape::API
    helpers Doorkeeper::Grape::Helpers

    prefix 'api'
    error_formatter :json, API::ErrorFormatter
    mount API::V1::Root
    # mount API::V2::Root (next version)
    add_swagger_documentation \
      :info => {
        :title => "Idea machine API"
      },
      :hide_documentation_path => true,
      :mount_path => "/swagger_doc",
      :markdown => false,
      :api_version => 'v1'

    before do
        header['Access-Control-Allow-Origin'] = '*'
        header['Access-Control-Request-Method'] = '*'
    end

  end
end

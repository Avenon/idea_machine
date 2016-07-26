require 'grape'
require 'grape-swagger'

module API
  module V1
    module Entities

      class Idea < Grape::Entity
          expose :id, documentation: {type: "Integer", desc: "Idea's unique id"}
          expose :description, documentation: {type: "String", desc: "Idea description information"}
          expose :user_id, documentation: {type: "Integer", desc: "User's unique id who create an idea"}
          expose :project_id, documentation: {type: "Integer", desc: "Project's unique id which link with idea"}
      end

      class Project < Grape::Entity
        expose :id, documentation: { type: "Integer", desc: "Project's unique id"}
        expose :descrition, documentation: {type: "String", desc: "Project description information"}
        expose :user_id, documentation: {type: "Integer", desc: "User's unique id who create a project"}
        expose :title, documentation: {type: "String", desc: "Project title name"}
      end

      class User < Grape::Entity
        expose :id, documentation: { type: "Integer", desc: "User's unique id"}
        expose :email, documentation: {type: "String", desc: "User email"}
      end

    end
  end
end

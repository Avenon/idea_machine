module API
  module V1
    class Projects < Grape::API

      resource :projects do

        version 'v1'
        format :json

        desc "Return a list of projects", { :entity => API::V1::Entities::Project }
        params do
          optional :limit, type: String, desc: 'limit view projects'
        end

        get '/' , http_codes: [
          [200, 'Ok', API::V1::Entities::Project]
        ] do
          projects = Project.all.limit(params[:limit])
          present projects, with: API::V1::Entities::Project, type: params[:type]
        end

        desc 'Create a new project.', { :entity => API::V1::Entities::Project }
        params do
          requires :projecttitle, type: String, desc: 'Project title'
          requires :projectdescription, type: String, desc: 'Project description'
          requires :user, type: String, desc: 'User id'
        end

        post '/', http_codes: [
          [200, "Ok", API::V1::Entities::Project]
        ] do
          project = Project.new
          project.user_id = params[:user]
          project.title = params[:projecttitle]
          project.descrition = params[:projectdescription]
          project.save

          status 200
          present project, with: API::V1::Entities::Project
        end

        desc 'Read a project.', { :entity => API::V1::Entities::Project }
        params do
          requires :id, type: String, desc: 'Project id'
        end
        get ':id', http_codes: [
          [200, 'Ok', API::V1::Entities::Project]
        ]  do
          project = Project.find(params[:id])
          present project, with: API::V1::Entities::Project, type: params[:type]
        end

        desc 'Update a project.'
        params do
          requires :id, type: String, desc: 'ID project'
          requires :projecttitle, type: String, desc: 'Project title'
          requires :projectdescription, type: String, desc: 'Project description'
          requires :user, type: String, desc: 'User id'
        end
        put ':id', http_codes: [
          [200, 'Ok', API::V1::Entities::Project]
        ]  do
          Project.find(params[:id]).update({
              user_id: params[:user],
              title: params[:projecttitle],
              descrition: params[:projectdescription]
            })
        end

        desc 'Delete a project.', { :entity => API::V1::Entities::Project }
        params do
          requires :id, type: String, desc: 'Project id'
        end

        delete ':id', http_codes: [
          [200, 'Ok', API::V1::Entities::Project]
        ]  do
          Project.find(params[:id]).destroy
        end
      end
    end
  end
end

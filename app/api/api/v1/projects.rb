module API
  module V1
    class Projects < Grape::API
      version 'v1'
      format :json

      resource :projects do

        desc 'List all projects.'
        params do
          optional :limit, type: String, desc: 'limit view projects'
        end
        get '/' do
          projects = Project.all.limit(params[:limit])
          projects.map do |project|
            { id: project.id,
              descrition: project.descrition,
              user_id: project.user_id,
              title: project.title }
            end
        end

        desc 'Create a project.'
        params do
          requires :projecttitle, type: String, desc: 'Project title'
          requires :projectdescription, type: String, desc: 'Project description'
          requires :user, type: String, desc: 'User id'
          # optional :test, type: String, desc: 'test' является необязательным параметром
        end
        post do
          Project.create!({
            user_id: params[:user],
            title: params[:projecttitle],
            descrition: params[:projectdescription]
            })
        end

        desc 'Read a project.'
        params do
          requires :id, type: String, desc: 'Project id'
        end
        get ':id' do
          project = Project.find(params[:id])
            { id: project.id,
              descrition: project.descrition,
              user_id: project.user_id,
              title: project.title }
        end

        desc 'Update a project.'
        params do
          requires :id, type: String, desc: 'ID project'
          requires :projecttitle, type: String, desc: 'Project title'
          requires :projectdescription, type: String, desc: 'Project description'
          requires :user, type: String, desc: 'User id'
        end
        put ':id' do
          Project.find(params[:id]).update({
              user_id: params[:user],
              title: params[:projecttitle],
              descrition: params[:projectdescription]
            })
        end

        desc 'Delete a project.'
        params do
          requires :id, type: String, desc: 'Project id'
        end
        delete ':id' do
          Project.find(params[:id]).destroy
        end
      end
    end
  end
end

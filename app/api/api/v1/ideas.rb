module API
  module V1
    class Ideas < Grape::API
      version 'v1'
      format :json

        resource :ideas do

          desc 'List all ideas.'
          params do
            optional :limit, type: String, desc: 'limit view ideas'
          end
          get '/' do
            ideas = Idea.all.limit(params[:limit])
            ideas.map do |idea|
              { id: idea.id,
                description: idea.description,
                user_id: idea.user_id,
                project_id: idea.project_id }
            end
          end

          desc 'Create an idea.'
          params do
            requires :ideadescription, type: String, desc: 'Idea description'
            requires :user, type: String, desc: 'User id'
            # optional :test, type: String, desc: 'test' является необязательным параметром
          end
          post do
            Idea.create!({
              user_id: params[:user],
              description: params[:ideadescription]
              })
            #Idea.create! params.permit(:user_id, :description)
          end

          desc 'Read an idea.'
          params do
            requires :id, type: String, desc: 'Idea id'
          end
          get ':id' do
            idea = Idea.find(params[:id])
              { id: idea.id,
                description: idea.description,
                user_id: idea.user_id,
                project_id: idea.project_id }
          end

          desc 'Update an idea.'
          params do
            requires :id, type: String, desc: 'ID idea'
            requires :ideadescription, type: String, desc: 'Idea description'
            requires :user, type: String, desc: 'User id'
          end
          put ':id' do
            Idea.find(params[:id]).update({
              user_id: params[:user],
              description: params[:ideadescription]
              })
          end

          desc 'Delete an idea.'
          params do
            requires :id, type: String, desc: 'Idea id'
          end
          delete ':id' do
            Idea.find(params[:id]).destroy
          end
        end
    end
  end
end

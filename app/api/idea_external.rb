require 'doorkeeper/grape/helpers'

module IdeaExternal
  class API < Grape::API
    helpers Doorkeeper::Grape::Helpers

    #before do
    #  doorkeeper_authorize!
    #end

    version 'v1', using: :header, vendor: 'ideamachine'
    format :json

    #mount API::Idea
    #mount API::Project
    #mount API::User
resource 'projects' do

    desc 'List all projects.'
    params do
      optional :limit, type: String, desc: 'limit view projects'
    end
    get '/' do
      Project.all.limit(params[:limit])
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
      Project.find(params[:id])
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

    resource 'users' do

    desc 'List all users'
    params do
      optional :limit, type: String, desc: 'limit view users'
    end
    get '/' do
      User.all.limit(params[:limit])
    end

    desc 'Create a user.'
    params do
      requires :useremail, type: String, desc: 'User email'
      requires :userpass, type: String, desc: 'User password'
    end
    post do
      User.create!({
        email: params[:useremail],
        password: params[:userpass]
        })
    end

    desc 'Update a user.'
    params do
      requires :id, type: String, desc: 'ID user'
      optional :useremail, type: String, desc: 'User email'
      optional :userpass, type: String, desc: 'User password'
    end
    put ':id' do
      User.find(params[:id]).update({
        email: params[:useremail],
        password: params[:userpass]
        })
    end
  end

  resource 'ideas' do

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
      Idea.find(params[:id])
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

module V1
  class UserAPI < Mount

    namespace :user do
      get ':id' do
        user = User.find(params[:id])
        present user, with: V1::Entities::UserEntity
      end
    end

  end
end

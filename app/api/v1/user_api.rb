module V1
  class UserAPI < Mount

    namespace :user do
      get ':id' do
        User.find(params[:id])
      end
    end

  end
end

require 'doorkeeper/grape/helpers'

module V1
  class Mount < API
    helpers Doorkeeper::Grape::Helpers
    version 'v1'

    before do
      doorkeeper_authorize!
    end

    mount UserAPI
  end
end

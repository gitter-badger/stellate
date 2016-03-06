module V1
  class Mount < API
    version 'v1'

    mount UserAPI
  end
end

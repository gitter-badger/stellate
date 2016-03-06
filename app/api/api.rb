class API < Grape::API
  format :json

  mount V1::Mount
end

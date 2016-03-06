class V1::Entities::ProfileEntity < Grape::Entity
  expose :display_name
  expose :bio
  expose :location
  expose :website
end

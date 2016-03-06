class V1::Entities::UserEntity < Grape::Entity
  expose :id
  expose :screen_name
  expose :profile, using: V1::Entities::ProfileEntity
end

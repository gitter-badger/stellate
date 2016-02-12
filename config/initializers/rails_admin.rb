RailsAdmin.config do |config|
  config.main_app_name = %w[Stellate Administration]

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.has_role? :admin
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.included_models = %w[
    User
    Profile
    Role
  ]
end

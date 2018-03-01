Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "projects#index"
  # Routes for the Mentorship resource:
  # CREATE
  get "/mentorships/new", :controller => "mentorships", :action => "new"
  post "/create_mentorship", :controller => "mentorships", :action => "create"

  # READ
  get "/mentorships", :controller => "mentorships", :action => "index"
  get "/mentorships/:id", :controller => "mentorships", :action => "show"

  # UPDATE
  get "/mentorships/:id/edit", :controller => "mentorships", :action => "edit"
  post "/update_mentorship/:id", :controller => "mentorships", :action => "update"

  # DELETE
  get "/delete_mentorship/:id", :controller => "mentorships", :action => "destroy"
  #------------------------------

  # Routes for the Dimension resource:
  # CREATE
  get "/dimensions/new", :controller => "dimensions", :action => "new"
  post "/create_dimension", :controller => "dimensions", :action => "create"

  # READ
  get "/dimensions", :controller => "dimensions", :action => "index"
  get "/dimensions/:id", :controller => "dimensions", :action => "show"

  # UPDATE
  get "/dimensions/:id/edit", :controller => "dimensions", :action => "edit"
  post "/update_dimension/:id", :controller => "dimensions", :action => "update"

  # DELETE
  get "/delete_dimension/:id", :controller => "dimensions", :action => "destroy"
  #------------------------------

  # Routes for the Subdimension resource:
  # CREATE
  get "/subdimensions/new", :controller => "subdimensions", :action => "new"
  post "/create_subdimension", :controller => "subdimensions", :action => "create"

  # READ
  get "/subdimensions", :controller => "subdimensions", :action => "index"
  get "/subdimensions/:id", :controller => "subdimensions", :action => "show"

  # UPDATE
  get "/subdimensions/:id/edit", :controller => "subdimensions", :action => "edit"
  post "/update_subdimension/:id", :controller => "subdimensions", :action => "update"

  # DELETE
  get "/delete_subdimension/:id", :controller => "subdimensions", :action => "destroy"
  #------------------------------

  # Routes for the Feedback resource:
  # CREATE
  get "/feedbacks/new", :controller => "feedbacks", :action => "new"
  post "/create_feedback", :controller => "feedbacks", :action => "create"

  # READ
  get "/feedbacks", :controller => "feedbacks", :action => "index"
  get "/feedbacks/:id", :controller => "feedbacks", :action => "show"

  # UPDATE
  get "/feedbacks/:id/edit", :controller => "feedbacks", :action => "edit"
  post "/update_feedback/:id", :controller => "feedbacks", :action => "update"

  # DELETE
  get "/delete_feedback/:id", :controller => "feedbacks", :action => "destroy"
  #------------------------------

  # Routes for the Staffing resource:
  # CREATE
  get "/staffings/new", :controller => "staffings", :action => "new"
  post "/create_staffing", :controller => "staffings", :action => "create"

  # READ
  get "/staffings", :controller => "staffings", :action => "index"
  get "/staffings/:id", :controller => "staffings", :action => "show"

  # UPDATE
  get "/staffings/:id/edit", :controller => "staffings", :action => "edit"
  post "/update_staffing/:id", :controller => "staffings", :action => "update"

  # DELETE
  get "/delete_staffing/:id", :controller => "staffings", :action => "destroy"
  #------------------------------

  # Routes for the Role resource:
  # CREATE
  get "/roles/new", :controller => "roles", :action => "new"
  post "/create_role", :controller => "roles", :action => "create"

  # READ
  get "/roles", :controller => "roles", :action => "index"
  get "/roles/:id", :controller => "roles", :action => "show"

  # UPDATE
  get "/roles/:id/edit", :controller => "roles", :action => "edit"
  post "/update_role/:id", :controller => "roles", :action => "update"

  # DELETE
  get "/delete_role/:id", :controller => "roles", :action => "destroy"
  #------------------------------

  # Routes for the Project resource:
  # CREATE
  get "/projects/new", :controller => "projects", :action => "new"
  post "/create_project", :controller => "projects", :action => "create"

  # READ
  get "/projects", :controller => "projects", :action => "index"
  get "/projects/:id", :controller => "projects", :action => "show"

  # UPDATE
  get "/projects/:id/edit", :controller => "projects", :action => "edit"
  post "/update_project/:id", :controller => "projects", :action => "update"

  # DELETE
  get "/delete_project/:id", :controller => "projects", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

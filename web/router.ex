defmodule PhoenixBlog.Router do
  use PhoenixBlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PhoenixBlog.Auth, repo: PhoenixBlog.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixBlog do
    pipe_through :browser # Use the default browser stack
    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/", PageController, :index
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixBlog do
  #   pipe_through :api
  # end
end

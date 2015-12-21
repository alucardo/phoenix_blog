defmodule PhoenixBlog.UserController do
  use PhoenixBlog.Web, :controller

  def index(conn, _params) do
    users = Repo.all(PhoenixBlog.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(PhoenixBlog.User, id)
    render conn, "show.html", user: user
  end
end

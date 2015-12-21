defmodule PhoenixBlog.UserView do
  use PhoenixBlog.Web, :view
  alias PhoenixBlog.User
  def first_name(%User{name: name}) do
    name
      |> String.split(" ")
      |> Enum.at(0)
  end
end

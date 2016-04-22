defmodule Jobs.UserView do
  use Jobs.Web, :view
  use JaSerializer.PhoenixView

  attributes [:username, :email]
end

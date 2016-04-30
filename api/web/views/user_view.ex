defmodule Jobs.UserView do
  use Jobs.Web, :view
  use JaSerializer.PhoenixView

  attributes [:username, :email, :given_name, :family_name, :additional_name]
end

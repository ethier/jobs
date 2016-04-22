defmodule Jobs.PageController do
  use Jobs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

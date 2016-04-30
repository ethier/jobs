defmodule Jobs.OrganizationController do
  use Jobs.Web, :controller

  alias Jobs.Organization

  plug Guardian.Plug.EnsureAuthenticated, handler: Jobs.AuthErrorHandler
  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    organizations = Repo.all(Organization)
    render(conn, "index.json", data: organizations)
  end

  def create(conn, %{"data" => organization_params}) do
    changeset = Organization.changeset(%Organization{}, organization_params)

    case Repo.insert(changeset) do
      {:ok, organization} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", organization_path(conn, :show, organization))
        |> render("show.json", data: organization)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Jobs.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organization = Repo.get!(Organization, id)
    render(conn, "show.json", data: organization)
  end

  def update(conn, %{"id" => id, "data" => %{"attributes" => organization_params}}) do
    organization = Repo.get!(Organization, id)
    changeset = Organization.changeset(organization, organization_params)

    case Repo.update(changeset) do
      {:ok, organization} ->
        render(conn, "show.json", data: organization)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Jobs.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Repo.get!(Organization, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(organization)

    send_resp(conn, :no_content, "")
  end
end

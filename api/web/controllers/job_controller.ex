defmodule Jobs.JobController do
  use Jobs.Web, :controller

  alias Jobs.Job

  plug Guardian.Plug.EnsureAuthenticated, handler: Jobs.AuthErrorHandler
  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render(conn, "index.json", data: jobs)
  end

  def create(conn, %{"data" => job_params}) do
    changeset = Job.changeset(%Job{}, job_params)

    case Repo.insert(changeset) do
      {:ok, job} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", job_path(conn, :show, job))
        |> render("show.json", data: job)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Jobs.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)
    render(conn, "show.json", data: job)
  end

  def update(conn, %{"id" => id, "data" => %{"attributes" => job_params}}) do
    job = Repo.get!(Job, id)
    changeset = Job.changeset(job, job_params)

    case Repo.update(changeset) do
      {:ok, job} ->
        render(conn, "show.json", data: job)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Jobs.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(job)

    send_resp(conn, :no_content, "")
  end
end

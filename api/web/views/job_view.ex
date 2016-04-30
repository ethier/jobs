defmodule Jobs.JobView do
  use Jobs.Web, :view

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, Jobs.JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, Jobs.JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      title: job.title,
      short_description: job.short_description,
      description: job.description,
      starts_at: job.starts_at,
      ends_at: job.ends_at,
      user_id: job.user_id,
      organization_id: job.organization_id,
      slug: job.slug}
  end
end

defmodule Jobs.OrganizationView do
  use Jobs.Web, :view

  def render("index.json", %{organizations: organizations}) do
    %{data: render_many(organizations, Jobs.OrganizationView, "organization.json")}
  end

  def render("show.json", %{organization: organization}) do
    %{data: render_one(organization, Jobs.OrganizationView, "organization.json")}
  end

  def render("organization.json", %{organization: organization}) do
    %{id: organization.id,
      legal_name: organization.legal_name,
      alternate_name: organization.alternate_name,
      slug: organization.slug}
  end
end

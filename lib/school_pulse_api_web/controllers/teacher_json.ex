defmodule SchoolPulseApiWeb.TeacherJSON do
  alias SchoolPulseApi.Teachers.Teacher
  alias SchoolPulseApi.Avatar

  @doc """
  Renders a list of teachers.
  """
  def index(%{teachers: teachers}) do
    {teachers, meta} = teachers

    %{
      data: for(teacher <- teachers, do: data(teacher)),
      meta: meta_data(meta)
    }
  end

  @doc """
  Renders a single teacher.
  """
  def show(%{teacher: teacher}) do
    %{data: data(teacher)}
  end

  defp data(%Teacher{} = teacher) do
    %{
      id: teacher.id,
      position: %{
        id: teacher.position.id,
        name: teacher.position.name
      },
      first_name: teacher.user.first_name,
      middle_name: teacher.user.middle_name,
      last_name: teacher.user.last_name,
      suffix: teacher.user.suffix,
      email: teacher.user.email,
      gender: teacher.user.gender,
      employee_number: teacher.employee_number,
      avatar: Avatar.url({teacher.user.avatar, teacher.user}, signed: true),
      philhealth: teacher.philhealth,
      gsis: teacher.gsis,
      tin: teacher.tin,
      pagibig: teacher.pagibig,
      plantilla: teacher.plantilla,
      date_hired: teacher.date_hired,
      date_promotion: teacher.date_promotion
    }
  end

  # TODO:  make this globally
  defp meta_data(meta) do
    %{
      current_page: meta.current_page,
      current_offset: meta.current_offset,
      size: meta.page_size,
      total: meta.total_count,
      pages: meta.total_pages
    }
  end
end

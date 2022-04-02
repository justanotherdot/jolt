defmodule JoltWeb.LayoutView do
  use JoltWeb, :view

  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end

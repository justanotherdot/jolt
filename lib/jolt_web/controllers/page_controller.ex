defmodule JoltWeb.PageController do
  use JoltWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule PitOfSonder.PageController do
  use PitOfSonder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule AutonomousLifeExWeb.PageController do
  use AutonomousLifeExWeb, :controller

  def home(conn, _params) do
    render(conn, :home, active_tab: :home)
  end
end

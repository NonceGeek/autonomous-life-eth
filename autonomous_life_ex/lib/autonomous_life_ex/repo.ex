defmodule AutonomousLifeEx.Repo do
  use Ecto.Repo,
    otp_app: :autonomous_life_ex,
    adapter: Ecto.Adapters.Postgres
end

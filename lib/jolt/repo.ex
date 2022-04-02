defmodule Jolt.Repo do
  use Ecto.Repo,
    otp_app: :jolt,
    adapter: Ecto.Adapters.Postgres
end

defmodule Bum.Repo do
  use Ecto.Repo,
    otp_app: :bum,
    adapter: Ecto.Adapters.Postgres
end

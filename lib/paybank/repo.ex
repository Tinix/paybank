defmodule Paybank.Repo do
  use Ecto.Repo,
    otp_app: :paybank,
    adapter: Ecto.Adapters.Postgres
end

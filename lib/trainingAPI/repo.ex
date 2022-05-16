defmodule TrainingAPI.Repo do
  use Ecto.Repo,
    otp_app: :trainingAPI,
    adapter: Ecto.Adapters.Postgres
end

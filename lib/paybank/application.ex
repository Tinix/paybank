defmodule Paybank.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PaybankWeb.Telemetry,
      # Start the Ecto repository
      Paybank.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Paybank.PubSub},
      # Start the Endpoint (http/https)
      PaybankWeb.Endpoint
      # Start a worker by calling: Paybank.Worker.start_link(arg)
      # {Paybank.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Paybank.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PaybankWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

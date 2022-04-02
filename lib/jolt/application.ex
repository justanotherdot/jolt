defmodule Jolt.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Jolt.Repo,
      JoltWeb.Telemetry,
      {Phoenix.PubSub, name: Jolt.PubSub},
      JoltWeb.Endpoint
      # Start a worker by calling: Jolt.Worker.start_link(arg)
      # {Jolt.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: Jolt.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    JoltWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

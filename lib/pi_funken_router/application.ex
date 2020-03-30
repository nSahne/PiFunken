defmodule PiFunkenRouter.Application do
  @moduledoc false

  use Application
  require Logger

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: PiFunkenRouter, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: PiFunkenRouter.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end

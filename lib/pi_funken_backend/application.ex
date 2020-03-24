defmodule PiFunkenBackend.Application do
  @moduledoc false

  use Application
  require Logger

  alias PiFunkenBackend.Router, as: Router

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: PiFunkenBackend.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end

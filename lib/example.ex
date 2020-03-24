defmodule PiFunkenBackend.Example do
  import Plug.Conn

  @spec init(any) :: any
  def init(options), do: options

  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end

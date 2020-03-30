defmodule PiFunkenRouter.Router.UserRouter do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    conn
    # |> IO.inspect()
    |> send_resp(200, "Users")
  end

  get "/:id" do
    IO.puts(conn.params["id"])
    send_resp(conn, 200, "User #{id}")
  end

  get _ do
    send_resp(conn, 404, "not found")
  end
end

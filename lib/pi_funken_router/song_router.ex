defmodule PiFunkenRouter.Router.SongRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> IO.inspect()
    |> send_resp(200, "Songs")
  end

  match "/:id" when id in ~w(1 2 3), via: :get do
    send_resp(conn, 200, "Song #{id}")
  end

  get _ do
    send_resp(conn, 404, "not found")
  end
end

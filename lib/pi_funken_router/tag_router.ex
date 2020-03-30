defmodule PiFunkenRouter.Router.TagRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> IO.inspect()
    |> send_resp(200, "Tags")
  end

  match "/:id" when id in ~w(1 2 3), via: :get do
    send_resp(conn, 200, "Tag #{id}")
  end

  get _ do
    send_resp(conn, 404, "not found")
  end
end

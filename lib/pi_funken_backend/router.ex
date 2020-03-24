defmodule PiFunkenBackend.Router do
  use Plug.Router

  plug(Plug.Logger, log: :debug)
  plug(Plug.Static, at: "/", from: {:pi_funken_backend, "priv/static/"})
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Welcome")
  end

  # get "/home" do
  #   conn = put_resp_content_type(conn, "text/html")
  #   send_file(conn, 200, "priv/index.html")
  # end

  get "/:name/greet" do
    send_resp(conn, 200, "Welcome #{name}")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end

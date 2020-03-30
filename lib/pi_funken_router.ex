defmodule PiFunkenRouter do
  use Plug.Router

  alias PiFunkenRouter.Router.{UserRouter, SongRouter, AlbumRouter, ArtistRouter, TagRouter}

  plug(Plug.Static, at: "/static/", from: {:pi_funken_router, "priv/static/"})
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Welcome")
  end

  forward("/users", to: UserRouter)

  forward("/songs", to: SongRouter)

  forward("/albums", to: AlbumRouter)

  forward("/artists", to: ArtistRouter)

  forward("/tags", to: TagRouter)

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end

defmodule BumWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :bum

  socket "/socket", BumWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :bum,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end




  plug Plug.Session,
    store: :cookie,
    key: "_bum_key",
    signing_salt: "secret"

  plug Pow.Plug.Session, otp_app: :bum

  plug Pow.Plug.Session,
    repo: Bum.Repo,
    user: Bum.Users.User,
    namespace: :user,
    current_user_assigns_key: :current_user

  plug Pow.Plug.Session,
    repo: Bum.Repo,
    user: Bum.Admin,
    namespace: :admin,
    current_user_assigns_key: :current_admin

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_bum_key",
    signing_salt: "A85bkzDv"

  plug BumWeb.Router
end

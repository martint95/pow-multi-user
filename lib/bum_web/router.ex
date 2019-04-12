defmodule BumWeb.Router do
  use BumWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/user", private: %{pow_namespace: :user} do
    pipe_through :browser

    pow_routes()
  end

  scope "/admin", private: %{pow_namespace: :admin} do
    pipe_through :browser

    pow_routes()
  end




  #routes
  scope "/", BumWeb do
    pipe_through [:browser]

    get "/", PageController, :index
  end



  scope "/user", BumWeb, private: %{pow_namespace: :user} do
    pipe_through [:browser, :protected]

    get "/", PageController, :user
  end

  scope "/admin", BumWeb, private: %{pow_namespace: :admin} do
    pipe_through [:browser, :protected]

    get "/", PageController, :admin
  end



  # Other scopes may use custom stacks.
  # scope "/api", BumWeb do
  #   pipe_through :api
  # end
end

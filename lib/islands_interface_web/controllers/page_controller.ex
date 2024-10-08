defmodule IslandsInterfaceWeb.PageController do
  use IslandsInterfaceWeb, :controller
  # alias IslandsEngine.StaticPageView
  # alias IslandsEngine.UserView
  # alias IslandsEngine.SessionView

  alias IslandsEngine.GameSupervisor

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # conn
    # |> put_flash(:error, "Let's pretend we have an error.")
    # |> render(conn, :home, layout: false)
    custom_form = %{}
    render(conn, :home, layout: false, custom_form: custom_form)
  end

  def hello(conn, _params) do
    html(conn, "hello, world!")
  end

  def test(conn, %{"name" => name}) do
    IO.puts "name: #{name}"
    # this prints only the list, not any strings
    # IO.inspect list
    # # using puts which also does not work
    # IO.puts "list is #{list}"
    # IO.inspect list, label: "The list is"
    # #⇒ The list is: [1, 2, 3]
    {:ok, _game} = GameSupervisor.start_game(name)
    conn
    |> put_flash(:info, "You entered the name: " <> name)
    |> render(:home, layout: false, custom_form: %{name: name})
  end
end

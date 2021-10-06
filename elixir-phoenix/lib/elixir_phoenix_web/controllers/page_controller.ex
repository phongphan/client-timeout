defmodule ElixirPhoenixWeb.PageController do
  use ElixirPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def delay(conn, %{"seconds" => seconds}) do
    {seconds, _} = Integer.parse(seconds)
    IO.puts("start delay")
    Process.sleep(seconds * 1000)
    IO.puts("end delay")

    text(conn, "Delay #{seconds} seconds")
  end
end

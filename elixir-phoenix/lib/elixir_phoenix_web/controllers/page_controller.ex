defmodule ElixirPhoenixWeb.PageController do
  use ElixirPhoenixWeb, :controller

  def delay(conn, %{"seconds" => seconds}) do
    {seconds, _} = Integer.parse(seconds)
    IO.puts("Delay #{seconds} seconds")
    Process.sleep(seconds * 1000)
    IO.puts("Delay finished")
    text(conn, "Delay #{seconds} seconds")
  end
end

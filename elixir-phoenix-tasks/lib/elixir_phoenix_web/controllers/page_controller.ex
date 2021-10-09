defmodule ElixirPhoenixWeb.PageController do
  use ElixirPhoenixWeb, :controller

  alias ElixirPhoenixWeb.TaskSupervisor

  def delay(conn, %{"seconds" => seconds}) do
    {seconds, _} = Integer.parse(seconds)
    task = Task.Supervisor.async_nolink(TaskSupervisor, fn -> do_delay(seconds) end)
    {:ok, seconds} = Task.await(task, 30_000)
    text(conn, "Delay #{seconds} seconds")
  end

  defp do_delay(seconds) do
    IO.puts("Delay #{seconds} seconds")
    Process.sleep(seconds * 1000)
    IO.puts("Delay finished")
    {:ok, seconds}
  end
end

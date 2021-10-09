defmodule ElixirPhoenixWeb.PageController do
  use ElixirPhoenixWeb, :controller

  alias ElixirPhoenix.DelayWorker
  alias ElixirPhoenix.DelayWorkerSupervisor

  def delay(conn, %{"seconds" => seconds}) do
    {seconds, _} = Integer.parse(seconds)
    {:ok, worker} = DelayWorkerSupervisor.create_worker()
    {:ok, seconds} = DelayWorker.delay(worker, seconds)
    text(conn, "Delay #{seconds} seconds")
  end
end

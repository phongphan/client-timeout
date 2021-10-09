defmodule ElixirPhoenix.DelayWorker do
  use GenServer

  def init(args) do
    {:ok, args}
  end

  def start_link(options), do: GenServer.start_link(__MODULE__, [], options)

  def delay(pid, seconds) do
    GenServer.call(pid, {:delay, seconds}, 100 + seconds*1000)
  end

  def handle_call({:delay, seconds}, _ref, state) do
    IO.puts("Delay #{seconds} seconds")
    Process.sleep(seconds * 1000)
    IO.puts("Delay finished")
    {:reply, {:ok, seconds}, state}
  end
end

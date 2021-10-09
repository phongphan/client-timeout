defmodule ElixirPhoenix.DelayWorkerSupervisor do
  use DynamicSupervisor

  alias ElixirPhoenix.DelayWorker

  def start_link(args), do: DynamicSupervisor.start_link(__MODULE__, args, name: __MODULE__)

  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def create_worker do
    DynamicSupervisor.start_child(__MODULE__, {DelayWorker, []})
  end
end

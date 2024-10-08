defmodule IslandsInterfaceWeb.GameChannel do
  use IslandsInterfaceWeb, :channel

  # alias IslandsEngine.{Game, GameSupervisor}

  def channel do
    quote do
      use Phoenix.Channel
      import IslandsInterfaceWeb.Gettext
    end
  end

  def handle_in("hellos", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def join("gameoriginal:" <> _player, _payload, socket) do
    {:ok, socket}
  end
end

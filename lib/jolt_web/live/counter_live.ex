defmodule JoltWeb.CounterLive do
  use JoltWeb, :live_view

  @topic "counter"

  def render(assigns) do
    ~L"""
    <h1>Counter</h1>
    <div>
      <div class="meter">
        <span style="width: <%= @amount %>%">
          <%= @amount %>
        </span>
      </div>

      <button phx-click="down">-</button>
      <button phx-click="up">+</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    JoltWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, :amount, 0)}
  end

  def handle_info(%{topic: @topic, payload: amount}, socket) do
    {:noreply, assign(socket, :amount, amount)}
  end

  def handle_event("up", _, socket) do
    amount = socket.assigns.amount + 1
    JoltWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", amount)
    {:noreply, assign(socket, :amount, amount)}
  end

  def handle_event("down", _, socket) do
    amount = socket.assigns.amount - 1
    JoltWeb.Endpoint.broadcast_from(self(), @topic, "donate_event", amount)
    {:noreply, assign(socket, :amount, amount)}
  end
end

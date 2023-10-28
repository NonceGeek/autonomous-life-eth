defmodule AutonomousLifeExWeb.PageLive do
  use AutonomousLifeExWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       modal: false,
       slide_over: false,
       pagination_page: 1,
       active_tab: :live
     )}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    case socket.assigns.live_action do
      :index ->
        {:noreply, assign(socket, modal: false, slide_over: false)}

      :modal ->
        {:noreply, assign(socket, modal: params["size"])}

      :slide_over ->
        {:noreply, assign(socket, slide_over: params["origin"])}

      :pagination ->
        {:noreply, assign(socket, pagination_page: String.to_integer(params["page"]))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    
      <.container class="mt-10">

      </.container>

      <.container class="mt-10 mb-32">
        <center><.h1>AI & Web3-based Game Panel</.h1>
        <br>
        <.h5>
          Run a autonomous life on chain, powered by 
          <a target="_blank" href="https://github.com/NonceGeek/movespace_db" style="color:blue">MoveSpaceDB</a>.
        </.h5>
        <br><br>
        </center>
        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">
          <.card>
            <center>
              <.card_media src={~p"/images/logo_autonomous_life.png"} style="width: 50%"/>
            </center>

            <.card_content category="MUD Game" heading="Autonomous Life">
              Run a autonomous life on chain, powered by 
              <a target="_blank" href="https://github.com/NonceGeek/movespace_db" style="color:blue">MoveSpaceDB</a>.
            </.card_content>

            <.card_footer>
            <.badge color="secondary" label="neoEVM" />
            <br><br>
            <a
              target="_blank"
              href="https://autonomous-life-p0tjhbl0o-leeduckgo.vercel.app/"
            >
              <.button label="View">
                Launch Game
              </.button>
            </a>
            </.card_footer>
          </.card>
        </div>

        <br><br>
        <center><.h2 underline label="Architecture"/>
          <.p>Here is the architecture of AI-based On-chain Game.</.p>
          <.card_media src={~p"/images/architecture.png"} style="width: 100%"/>
        </center>
      </.container>

    """
  end

  @impl true
  def handle_event("close_modal", _, socket) do
    {:noreply, push_patch(socket, to: "/live")}
  end

  def handle_event("close_slide_over", _, socket) do
    {:noreply, push_patch(socket, to: "/live")}
  end
end

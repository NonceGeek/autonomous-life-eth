defmodule AutonomousLifeExWeb.DorahacksLive do
  use AutonomousLifeExWeb, :live_view
  alias AutonomousLifeEx.{App, ProjectAnalyzer}
  alias AutonomousLifeEx.Contracts.{DorahacksGrantInteractor, DorahacksBountyInteractor}

  @impl true
  def mount(_params, _session, socket) do
    grants = DorahacksGrantInteractor.fetch_grant_info(:all)
    bounties = DorahacksBountyInteractor.fetch_bounty_info(:all)
    {:ok,
     assign(
      socket,
      modal: false,
      form: to_form(%{}, as: :f),
      grants: grants,
      bounties: bounties
     )}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, socket}
  end

    @impl true
    def handle_event(_key, _params, socket) do
        {:noreply, socket}
    end 

  @impl true
  def render(assigns) do
    ~H"""
    <.container class="mt-10 mb-32">
    <center><.h1 underline label="Dorahacks Panel"/></center>
    <center><.h5>The Dorahacks Panel is used to present the records of DAO on Dorahacks, including two items: <br>Bounties information, Grant information.</.h5></center>
        <br>
        <center><.h2 label="Grants" /></center>

        <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-3">
        <%= for grant <- @grants do %>
            <.card>
            <center>
            <.card_media src={grant.logo_link} style="width: 50%"/>
            </center>
            <.card_content category={grant.category} heading={grant.name}>
                <%= grant.intro %>
            <br><br>
            <center> --- Onchain Grant Data --- </center>

            <b>Round ID: <a href={"https://dorahacks.io/zh/aptos/#{grant.round_id}/top"} target="_blank" style="color:blue"><%=grant.round_id %></a></b> 
            <br>
            <b>Votes: <%=grant.votes %></b>
            <br>
            <b>PRIZES: </b>  <a href={"https://dorahacks.io/zh/aptos/#{grant.round_id}/top"} target="_blank" style="color:blue"> <%= "Dorahacks Aptos Grant R#{grant.round_id}" %> </a>
            </.card_content>


            <.card_footer>
            <br>
            <a
              target="_blank"
              href={grant.url}
            >
              <.button to="/"color="primary" label="Primary" variant="outline">
                Homepage
              </.button>
            </a>
            <a
              target="_blank"
              href={"https://dorahacks.io/buidl/#{grant.dorahacks_id}"}
            >
              <.button to="/" color="secondary" label="Secondary" variant="outline" >
                See Project on Dorahacks
              </.button>
            </a>
            
          </.card_footer>
        </.card>
        <% end %>

      </div>

      <br><hr><br>
      <center><.h2 label="Bounties" /></center>
      <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-4">
      <%= for bounty <- @bounties do %>
      <.card>
            <.card_content category={bounty.category} heading={bounty.title}>

            </.card_content>
            <.card_footer>
                <a
                    target="_blank"
                    href={"https://dorahacks.io/daobounty/#{bounty.dorahacks_id}"}
                >
                    <.button to="/" color="secondary" label="Secondary" variant="outline" >
                        See Bounty on Dorahacks
                    </.button>
                </a>
                <b>Token For Bounty: </b> <%= bounty.coin_type %>
                <br>
                <b>Money: </b> <%= bounty.balance %>
                <br>
                <b>Finished?: </b> <%= bounty.has_paid_out %>
                <br>
                <b>Finisher: </b>
                <%= for finisher <- bounty.finishers do %>
                    <.badge color="success" label={finisher} />
                <% end %>
            </.card_footer>
        </.card>
      <% end %>
      </div>
      </.container>
    """
  end

end

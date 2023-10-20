defmodule AutonomousLifeExWeb.DAOLive do
  use AutonomousLifeExWeb, :live_view
  alias AutonomousLifeEx.{App, ProjectAnalyzer}
  alias AutonomousLifeEx.Contracts.MoveDIDInteractor

  @daos %{donation_dao: "0x5f56d07152c7ca04bbfb1d23299275a84ee40ca2deb4be61a4361eeeb1a7e400"}
  @impl true
  def mount(_params, _session, socket) do
    donation_dao = MoveDIDInteractor.get_addr_aggregator(@daos.donation_dao)
    {:ok,
     assign(
      socket,
      donation_dao: donation_dao,
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
    <center><.h1 underline label="DAO Panel"/></center>
    <center><.h5>Show all the DAOs that based on MoveDID Protocol.</.h5></center>
      <br>

      <div class="grid gap-5 mt-5 md:grid-cols-1 lg:grid-cols-1">

      <!-- DAO -->
      <.card>
        <center>
          <.card_media src={~p"/images/logo_donation.png"} style="width: 50%"/>
        </center>
        <.card_content category="sub-DAO of NonceGeek" heading="donationDAO">
          <%= @donation_dao.description %>
          <br><br>
          <.badge color="primary" label="dao-member-list" />
          <br><br>
          <center> <b><%=">>>"%> DAO Member List <%="<<<"%> </b>
          <br>
          <%= for addr <- @donation_dao.addrs do %>
            <a href={"https://etherscan.io/address/#{addr}"} target="_blank" style="color:blue"> <%= addr %> </a>
            <br>
          <% end %>
          </center>
        </.card_content>
      </.card>

      </div>
      </.container>
    """
  end

end

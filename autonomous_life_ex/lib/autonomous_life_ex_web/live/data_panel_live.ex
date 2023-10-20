defmodule AutonomousLifeExWeb.DataPanelLive do
  use AutonomousLifeExWeb, :live_view
  alias AutonomousLifeEx.{App, ProjectAnalyzer}

  @impl true
  def mount(_params, _session, socket) do
    movedid= 
    {:ok,
     assign(
      socket,
      modal: false,
      form: to_form(%{}, as: :f),
      movedid_user_num: 12,
      airdropper_tx_data: 55,
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
      <center><.h1 underline label="Data Panel"/></center>
      <center><.h5>The Data Panel is used to present the information of each program, including three items: <br>on-chain user information, off-chain user information, and developer information.</.h5></center>
      <br>
      <center><.h2 label="Stage - Beta" /></center>

      <div class="grid gap-5 mt-5 md:grid-cols-2 lg:grid-cols-2">

      <!-- MoveDID -->
      <.card>
        <center>
          <.card_media src={~p"/images/logo_did.png"} style="width: 50%"/>
        </center>
        <.card_content category="Identity" heading="MoveDID">
          Using MoveDID to aggregate your addresses and services.
          <br><br>
          <.badge color="primary" label="released - beta" />
          <br><br>
          <center> --- Onchain User Data --- </center>
          <b>NUM: <a href="" target="_blank" style="color:blue"><%= @movedid_user_num %> </a></b> 
          <br>
          <b>DESCRIPTION: </b> This metric is the number of users who signed up for MoveDID.
          <center> --- Developer Data --- </center>
          <b>DEVELOPERS: </b>
            <a href="https://github.com/leeduckgo" target="_blank" style="color:blue">leeduckgo</a>
            <a href="https://github.com/99Kies" target="_blank" style="color:blue">99Kies</a>
            <a href="https://github.com/xingxinglian" target="_blank" style="color:blue">xingxinglian</a>
            <a href="https://github.com/qpb8023" target="_blank" style="color:blue">qpb8023</a>
            <a href="https://github.com/yekai1003" target="_blank" style="color:blue">yekai1003</a>
            <a href="https://github.com/hqwangningbo" target="_blank" style="color:blue">hqwangningbo</a>
            <a href="https://github.com/lingxiyang" target="_blank" style="color:blue">lingxiyang</a>

          <br>
          <b>GRANTS: Aptos Official Grant R1</b>
          <br>
          <b>PRIZES: </b> <a href="https://dorahacks.io/zh/aptos/1/top" target="_blank" style="color:blue"> Dorahacks Aptos Grant R1 </a>
        </.card_content>
      </.card>

      <!-- Airdropper -->
      <.card>
        <center>
          <.card_media src={~p"/images/logo_airdropper.png"} style="width: 50%"/>
        </center>
        <.card_content category="Economic" heading="Airdropper based on Github">
          Airdrop coins & NFTs for the contributors of Repos / Organiazations.
          <br><br>
          <.badge color="primary" label="released - beta" />
          <br><br>
          <center> --- Onchain User Data --- </center>
          <b>NUM:  <a href="" target="_blank" style="color:blue"><%= @airdropper_tx_data %> </a></b> 
          <br>
          <b>DESCRIPTION: </b> This metric is the number of airdrops performed using Airdropper.
          <center> --- Developer Data --- </center>
          <b>DEVELOPERS: </b>
            <a href="https://github.com/leeduckgo" target="_blank" style="color:blue">leeduckgo</a>
            <a href="https://github.com/ETH-KT" target="_blank" style="color:blue">ETH-KT</a>
            <a href="https://github.com/qwang98" target="_blank" style="color:blue">qwang98</a>
            <a href="https://github.com/web3olalala" target="_blank" style="color:blue">web3olalala</a>
            <a href="https://github.com/zven21" target="_blank" style="color:blue">zven21</a>
          <br>
          <b>PRIZES: </b> <a href="https://dorahacks.io/zh/aptos/round-2/top" target="_blank" style="color:blue"> Dorahacks Aptos Grant R2 </a>
          <br>
          </.card_content>
      </.card>  

      </div>
      </.container>
    """
  end

end

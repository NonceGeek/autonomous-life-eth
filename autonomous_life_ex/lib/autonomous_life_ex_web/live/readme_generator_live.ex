defmodule AutonomousLifeExWeb.ReadmeGeneratorLive do
  use AutonomousLifeExWeb, :live_view
  alias AutonomousLifeEx.ReadmeGenerator

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(
      socket,
      modal: false,
      form: to_form(%{}, as: :f),
      name: "",
      description: "",
      eth_addr: "",
      aptos_addr: "",
      five_awesome_repos: "",
      daos_joined_in: "",
      articles: ""
     )}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("generate", %{"f" => form_params}, socket) do
    readme_raw =
    form_params
    |> ExStructTranslator.to_atom_struct()
    |> ReadmeGenerator.generate()
    {
      :noreply,
      assign(
        socket,
        readme_raw: readme_raw
      )

    }
  end

  @impl true
  def handle_event("change", %{"f" => params}, socket) do
    params_atomed =
      ExStructTranslator.to_atom_struct(params)
    {
      :noreply,
      socket
      |> assign(name: params_atomed.name)
      |> assign(description: params_atomed.description)
      |> assign(eth_addr: params_atomed.eth_addr)
      |> assign(aptos_addr: params_atomed.aptos_addr)
      |> assign(five_awesome_repos: params_atomed.five_awesome_repos)
      |> assign(daos_joined_in: params_atomed.daos_joined_in)
      |> assign(articles: params_atomed.articles)
    }
  end

  @impl true
  def handle_event(_key, _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.container class="mt-10 mb-32">
      <center><.h1 label="README Generator(Developing)" /></center>
      <.form for={@form} phx-change="change" phx-submit="generate">

        <.h5 label="Your Name" />
        <.input field={@form[:name]} value={@name}/>

        <br>
        <.h5 label="Description(Supportted Markdown)" />
        <.textarea form={@form} field={:description} value={@description}/>

        <br>
          <.h5 label="MoveDID(Optional)" />
          <.textarea form={@form} field={:move_did} />

        <br>
        <.h5 label="Ethereum Address" />
        <.input field={@form[:eth_addr]} value={@eth_addr}/>

        <br>
        <.h5 label="Aptos Address" />
        <.input field={@form[:aptos_addr]} value={@aptos_addr}/>

        <br>
        <.h5 label="Github Acct(Intelligent analysis of data in Github)" />
        <.input field={@form[:github_acct]} />

        <br>
        <.h5 label="Awesome Repo Links(Top5 Repos that you contributed with)" />
        <.input field={@form[:five_awesome_repos]} value={@five_awesome_repos}/>

        <br>
        <.h5 label="DAOs joined in" />
        <.input field={@form[:daos_joined_in]} value={@daos_joined_in} />

        <br>
        <.h5 label="Awesome Articles(Top5 articles you written)" />
        <.input field={@form[:articles]} value={@articles} />

        <br>
        <center>
          <.button color="info" label="Generate Awesome REDME.md!" />
        </center>
      </.form>
      <%= if !is_nil(assigns[:readme_raw]) do %>
        <.h5 label="README.md" />
        <.textarea style="height: 800px" form={@form} value={assigns[:readme_raw]} />
        <br>
        <center><.h1 label="Preview" /></center>
        <br>
      <% end %>

      </.container>
    """
  end

end

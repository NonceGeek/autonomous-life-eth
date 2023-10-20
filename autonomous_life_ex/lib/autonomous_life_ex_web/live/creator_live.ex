defmodule AutonomousLifeExWeb.CreatorLive do
  use AutonomousLifeExWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
        role_form: to_form(%{}, as: :f),
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
        <center><.h3>Roles Vector Dataset</.h3>
        <.p><a href="" target="_blank" style="color:blue">View all the Roles</a></.p>
            <.simple_form for={@role_form} phx-change="role_change_input" phx-submit="role_submit">
            <.text_input form={@role_form} field={:question} placeholder="Enter the Nature Language to search a role." value={assigns[:search_question_now]}/>
            <.button color="secondary" label="Search!" variant="outline" />
        </.simple_form>

        </center>

        <!-- result panel -->
        <div class="grid gap-5 mt-5 md:grid-cols-1 lg:grid-cols-1" style="height: auto;">
            <.card>
                <%= if not is_nil(assigns[:search_result]) do %>
                <br>
                <.p><b>Search Results in Dataset:</b></.p>
                <.table>
                    <thead>
                    <.tr>
                        <.th>Result</.th>
                        <.th>Metadata</.th>
                    </.tr>
                    </thead>
                    <tbody>
                    <%= for elem <- assigns[:search_result] do %>
                    <.tr>
                        <.td><%= elem.data %></.td>
                        <.td><%= inspect(elem.metadata) %></.td>
                    </.tr>
                    <% end %>
                    </tbody>
                </.table>

                <% else %>
                <br><br><br>
                    <b>the search results would be shown here.</b>
                <br><br><br><br>
                <% end %>
            </.card>
        </div>
        <br>
        <center>
            <.button phx-click="gen_a_new_role" color="secondary" label="基于以上角色，用 AI 生成一个新角色" variant="outline" />
            <br><br>
            <.p>新角色:</.p>
            <.textarea value={assigns[:new_role]}/>
            <br>
            <.button phx-click="gen_a_new_role" color="secondary" label="将新角色上传到向量数据库" variant="outline" />
            <br><br>
            <.button phx-click="gen_a_new_role" color="secondary" label="将新角色上传到 Arweave 网络" variant="outline" />
        </center>

        <br>
        <br><hr>

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


  def handle_event("role_submit", %{"f" => %{"question" => question}}, socket) do
    # search in role dataset by the question.
    # if found, return the role.
    {:ok, %{similarities: similarities}} = 
    EmbedbaseEx.search_data("roles-for-autonomous-life", question, Constants.get_embedbase_key())
    {
        :noreply, 
        assign(socket,
            search_result: similarities
        )}
  end

  def handle_event("gen_a_new_role", _, socket) do
    # call smart prompter to generate a new role
    {
        :noreply, 
        assign(socket,
            new_role: "新角色"
        )
    }
  end

  def handle_event(key, params, socket) do
    IO.puts inspect key
    IO.puts inspect params
    {:noreply, socket}
  end
end

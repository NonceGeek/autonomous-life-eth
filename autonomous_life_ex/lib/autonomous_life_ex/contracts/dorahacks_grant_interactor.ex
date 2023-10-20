defmodule AutonomousLifeEx.Contracts.DorahacksGrantInteractor do
    @moduledoc """
        See Examples in Web3_Aptos_Ex
    """
    alias Web3AptosEx.Aptos.RPC
    import Web3AptosEx.Aptos
    alias Web3AptosEx.Aptos
    alias AutonomousLifeEx.Project

    @contract_addr Constants.get_dorahacks_grant_addr
    @project_list ["5858", "4334", "4340"] # "6952"

    @resources %{
        data: "#{@contract_addr}::qf::Data",
    }

    # +---------------------+
    # |       Interface     |
    # +---------------------+

    def fetch_grant_info(:all) do
        {:ok, client} = Aptos.connect(:mainnet)
        data = get_data(client)
        data_on_chain = 
            Enum.reduce(@project_list, [], fn project_id, acc ->
                [grant_info] = fetch_grant_info(data, project_id)
                proj_info = Project.get(project_id)
                acc ++ [Map.merge(grant_info, proj_info)]
            end)
    end

    def fetch_grant_info(%{rounds: rounds} = _data, project_id) do
        rounds
        |> Enum.map(fn %{id: r_id, projects: projects} ->
            proj = Enum.find(projects, fn %{owner: p_id} -> p_id == "0x#{project_id}" end)
            if is_nil(proj) do
                nil
            else 
                Map.put(proj, :round_id, r_id)
            end
        end)
        |> Enum.reject(fn x -> is_nil(x) end)
    end

    # +---------------------+
    # | Contract Interactor |
    # +---------------------+

    def get_data(client) do
      with {:ok, result} <- RPC.get_resource(
        client,
        @contract_addr,
        @resources.data) do
        result.data
      end
    end


    # def get_proposal_set(client) do
    #     with {:ok, result} <- RPC.get_resource(
    #         client,
    #         @contract_addr,
    #         @resources.proposal_set) do
    #         result.data
    #     end
    # end
    
    # def get_proposal_index(client) do
    #     client
    #     |> get_proposal_set()
    #     |> Map.fetch!(:titles)
    # end

    # def get_proposal_by_index(client, index) do
    #     %{proposal_map: %{handle: proposal_map}} = get_proposal_set(client)
    #     with {:ok, result} <- Web3AptosEx.Aptos.get_table_item(
    #         client,
    #         proposal_map,
    #         "0x1::string::String",
    #         @resources.proposal,
    #         index
    #     ) do
    #         result
    #     end
    # end

    # def get_proposal_approve(client, proposal_title) do
    #     Web3AptosEx.Aptos.call_view_func(client, "#{@contract_addr}::governancer::get_proposal_approve", [], [proposal_title])

    # end

    # def get_proposal_deny(client, proposal_title) do
    #     Web3AptosEx.Aptos.call_view_func(client, "#{@contract_addr}::governancer::get_proposal_deny", [], [proposal_title])
    # end

    # def transfer(client, acct, to, amount) do
    #   {:ok, f} = ~a"0x1::coin::transfer<CoinType>(address, u64)"
    #   payload = Aptos.call_function(f, ["0x1::aptos_coin::AptosCoin"], [to, amount])
    #   Aptos.submit_txn(client, acct, payload)
    # end
    
end
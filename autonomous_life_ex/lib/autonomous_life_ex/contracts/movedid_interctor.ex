defmodule AutonomousLifeEx.Contracts.MoveDIDInteractor do
    @moduledoc """
        See Examples in Web3_Aptos_Ex
    """
    alias Web3AptosEx.Aptos.RPC
    import Web3AptosEx.Aptos
    alias Web3AptosEx.Aptos
    alias AutonomousLifeEx.Project

    @contract_addr Constants.get_movedid_addr

    @resources %{
        addr_aggregator: "#{@contract_addr}::addr_aggregator::AddrAggregator",
    }

    # +---------------------+
    # | Contract Interactor |
    # +---------------------+

    def get_addr_aggregator(addr) do
        {:ok, client} = Aptos.connect(:mainnet)  
        with {:ok, result} <- RPC.get_resource(
            client,
            addr,
            @resources.addr_aggregator) do
            result.data
        end
    end
    
end
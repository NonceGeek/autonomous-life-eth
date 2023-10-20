defmodule AutonomousLifeEx.ProjectAnalyzer do
    alias Web3AptosEx.Aptos
    alias AutonomousLifeEx.App

    # +--------------------+
    # | On-Chain User Data |
    # +--------------------+

    def client() do
        {:ok, client} = Web3AptosEx.Aptos.connect(:mainnet)
        client
    end

    def get_user_data_based_on_event_num(%App{
        aptos:
        %{event:
        %{
            event_owner: contract_addr, 
            event_handle: event_handle, 
            field: field
        }}}) do

        get_user_data_based_on_event_num(contract_addr, event_handle, field)
    end

    def get_user_data_based_on_event_num(contract_addr, event_handle, field) do

        {:ok,
            [%{
                sequence_number: seq_num
            }]
        } = Aptos.get_events(
            client(), 
            contract_addr, 
            # "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f", 
            event_handle, 
            # "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f::addr_aggregator::CreateAddrAggregatorEventSet", 
            field, 
            [limit: 1]
        )
        link = 
            Aptos.build_event_path(client(), contract_addr, event_handle, field)
        %{num: seq_num, link: link}
    end

    # +---------------------+
    # | Off-Chain User Data |
    # +---------------------+

    # +----------------+
    # | Developer Data |
    # +----------------+



end
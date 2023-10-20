defmodule AutonomousLifeEx.App do
    alias __MODULE__, as: App
    alias AutonomousLifeEx.ProjectAnalyzer

    defstruct [
        name: nil,
        chains: [],
        aptos: %{
            contract_addr: "0x0", 
            event: %{
                event_owner: "0x0",
                event_handle: "0x0",
                field: "",
            },
            # tx_num: 0,
            user_info: %{
                user_num: 0,
                used_num: 0,
            }
        }, 

    ]

    def app("MoveDID") do
        app = %App{
            name: "move_did",
            chains: ["aptos"],
            aptos: %{
                contract_addr: "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f",
                event: %{
                    event_owner: "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f",
                    event_handle: "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f::addr_aggregator::CreateAddrAggregatorEventSet", 
                    field: "create_addr_aggregator_events"
                }

            }
        }
        user_num = 
            app
            |> ProjectAnalyzer.get_user_data_based_on_event_num()
            |> String.to_integer()
        Map.put(app, :user_num, user_num)
    end

    def app("Moveflow") do
        %App{
            name: "move_did",
            chains: ["aptos"],
            aptos: %{
                contract_addr: "TODO",
            },
        } 
    end


end
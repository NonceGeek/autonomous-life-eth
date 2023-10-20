defmodule AutonomousLifeEx.Contracts.DorahacksBountyInteractor do
    @moduledoc """
        See Examples in Web3_Aptos_Ex
    """
    alias Web3AptosEx.Aptos.RPC
    import Web3AptosEx.Aptos
    alias Web3AptosEx.Aptos
    alias AutonomousLifeEx.{Project, Bounty}

    @contract_addr Constants.get_dorahacks_bounty_addr
    @bounty_list ["7", "6", "5", "4", "3"]

    @resources %{
        data: "#{@contract_addr}::bounty::Data",
        bounty: "#{@contract_addr}::bounty::Bounty",
    }

    # +---------------------+
    # |       Interface     |
    # +---------------------+

    def fetch_bounty_info(:all) do
        bounties_on_chain = 
            :cache
            |> get_data()
            |> sum_money()
        bounty_offline = Enum.map(@bounty_list, fn index -> Bounty.get(index) end)
        Enum.map(bounties_on_chain, fn bounty_on_chain ->
            bounty_offline
            |> Enum.find(fn bounty_offline -> bounty_offline.index == bounty_on_chain.index end)
            |> Map.merge(bounty_on_chain)
        end)
    end

    def sum_money(bounty_list) do
        Enum.map(bounty_list, fn %{contributions: contributions} = bounty ->
            sum = Enum.reduce(contributions, 0, fn %{amount: amount}, acc -> acc + String.to_integer(amount) end)
            Map.put(bounty, :balance, sum / 100000000)
        end)
    end

    # +------------+
    # | Local Data |
    # +------------+

    def get_data(:cache) do
        [
            %{
              balance: "800000000",
              coin_type: "0x1::aptos_coin::AptosCoin",
              contributions: [
                %{
                  account: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed",
                  amount: "800000000"
                }
              ],
              escrow_address: "0xe1629c85ff4e171fa8c02809ce0b7cf3e537bbcbc07e7d2e02b53cd561bdc66b",
              fulfillers: [],
              has_paid_out: false,
              index: "7",
              issuer: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed"
            },
            %{
              balance: "0",
              coin_type: "0x1::aptos_coin::AptosCoin",
              contributions: [
                %{
                  account: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed",
                  amount: "800000000"
                }
              ],
              escrow_address: "0xd685ad9fae1a494e5de7ab2cfc27e31e71a93e30811e48ca29ec613defc9ed29",
              fulfillers: [
                %{
                  account: "0x8ec1db804d24a88cb86420d7e127f9952ce0d2ec0543051996fbd77b231e9c94",
                  amount: "800000000"
                }
              ],
              has_paid_out: true,
              index: "6",
              issuer: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed"
            },
            %{
              balance: "0",
              coin_type: "0x1::aptos_coin::AptosCoin",
              contributions: [
                %{
                  account: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed",
                  amount: "5000000000"
                }
              ],
              escrow_address: "0x5682ec2ea4f34a6db7a0e4c8e904fb19387ceed77f0a53d145c218ad564dde41",
              fulfillers: [
                %{
                  account: "0x5b115f12ed7da9f545d26f5ee2f2fcba9f6682a8e78af5cedf8f748c708ed810",
                  amount: "5000000000"
                }
              ],
              has_paid_out: true,
              index: "5",
              issuer: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed"
            },
            %{
              balance: "0",
              coin_type: "0x1::aptos_coin::AptosCoin",
              contributions: [
                %{
                  account: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed",
                  amount: "2400000000"
                }
              ],
              escrow_address: "0x2657324f7b8661dde6566d5440aeae7c3b334375f50e5ee7923f46fc97421bab",
              fulfillers: [
                %{
                  account: "0xb4b49dbeaa4b03cb0eec7173b069d85abdd312f87f3dc2b0943cb560221b3077",
                  amount: "2400000000"
                }
              ],
              has_paid_out: true,
              index: "4",
              issuer: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed"
            },
            %{
              balance: "0",
              coin_type: "0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDC",
              contributions: [
                %{
                  account: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed",
                  amount: "100000000"
                }
              ],
              escrow_address: "0xa2757595e6601d76be3094ab0f4887da614c4a70e9d4d9b8ac2a5c9f93a29723",
              fulfillers: [
                %{
                  account: "0x6a7f5c4966131b03978d4c8a1298c34b337b8bbc6b715db18c07eb7e6b149bec",
                  amount: "100000000"
                }
              ],
              has_paid_out: true,
              index: "3",
              issuer: "0x2df41622c0c1baabaa73b2c24360d205e23e803959ebbcb0e5b80462165893ed"
            }
          ]
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

    def get_all_bounty(client) do
        Enum.map(@bounty_list, fn index ->
            onchain_result = get_bounty_by_index(client, index)
            Map.put(onchain_result, :index, index)
        end)
    end

    def get_bounty_by_index(client, index) do
        %{bounties: %{handle: bounties_map}} = get_data(client)
        with {:ok, result} <- Web3AptosEx.Aptos.get_table_item(
            client,
            bounties_map,
            "u64",
            @resources.bounty,
            index
        ) do
            result
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
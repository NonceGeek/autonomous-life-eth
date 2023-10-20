defmodule Constants do
    def get_github_token() do
      System.get_env("GITHUB_TOKEN")
    end

    def get_embedbase_key() do
      System.get_env("EMBEDBASE_KEY")
    end

    def get_dorahacks_grant_addr() do
      "0xfdc62aa0a9312cb856c50f7b81a8108c19498b4c832f8f32ddd4860ae4a38977"
    end

    def get_dorahacks_bounty_addr() do
      "0x19fc15bc00b0cd1af65aca0e08ae3c932a4be6fd48feea2f20887d6f71020318"
    end

    def get_movedid_addr() do
      "0x61b96051f553d767d7e6dfcc04b04c28d793c8af3d07d3a43b4e2f8f4ca04c9f"
    end
  end

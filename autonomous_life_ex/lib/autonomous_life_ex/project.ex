defmodule AutonomousLifeEx.Project do
    defstruct name: nil,
        dorahacks_id: nil,
        category: nil,
        intro: nil,
        url: nil,
        github_link: nil,
        logo_link: nil
    # +----------------------------------------+
    # | Projects: TODO: put them into database |
    # +----------------------------------------+

    # Aptos-E2E-Test-Tool
    def get("5858") do
        %__MODULE__{
            name: "Aptos-E2E-Test-Tool",
            dorahacks_id: "5858",
            intro: "The offline implementation for End-2-End Aptos Smart Contract Test Tool.",
            url: "https://github.com/NonceGeek/aptos_e2e_test_tool",
            logo_link: "/images/logo_move_e2e_test_tool.png", 
            category: "Safety"
        }
    end

    # Move-Airdropper-Based-On-Github
    def get("4334") do
        %__MODULE__{
            name: "Move-Airdropper-Based-On-Github",
            dorahacks_id: "5858",
            intro: "Airdrop coins & NFTs for the contributors of Repos / Organiazations.",
            url: "https://airdropper.movedid.build/",
            logo_link: "/images/logo_airdropper.png",
            category: "Economic"
        }
    end

    # MoveFlow
    def get("4340") do
        %__MODULE__{
            name: "MoveFlow",
            dorahacks_id: "4340",
            intro: "Real-time, seamless, and uninterrupted payment streams.",
            url: "https://www.moveflow.xyz", 
            logo_link: "/images/logo_moveflow.png",
            category: "Protocol"
        } 
    end
end
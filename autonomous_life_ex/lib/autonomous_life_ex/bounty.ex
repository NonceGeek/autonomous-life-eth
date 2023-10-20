defmodule AutonomousLifeEx.Bounty do
    defstruct title: nil,
        index: nil,
        details: nil,
        category: nil,
        finishers: [],
        finished_proof: [],
        dorahacks_id: nil

    # +----------------------------------------+
    # | Projects: TODO: put them into database |
    # +----------------------------------------+

    
    # Programmable Transaction
    def get("3") do
        %__MODULE__{
            title: "Programmable Transaction",
            index: "3",
            dorahacks_id: "318", 
            category: "Writing",
            details: "Finish an article about programmable transaction(Move Ecosystem).", 
            finishers: ["Ashley"],
            finished_proof: ["https://noncegeek.medium.com/sui-programmable-transaction-block-ptbs-learning-move-0x03-6b1abef44dea"]
        }
    end

    # frisbee
    def get("4") do
        %__MODULE__{
            title: "Design a NonceGeekDAO-themed frisbee, the elements include: Tao Te Ching and Fibonacci spiral",
            index: "4",
            dorahacks_id: "319",
            category: "Design",
            details: "Design a NonceGeekDAO-themed frisbee, the elements include: Tao Te Ching and Fibonacci spiral.\nPrize Equals to 1300 RMB, 180 USD.",
            finishers: ["Hermesa"],
            finished_proof: ["https://mp.weixin.qq.com/s/qt_xvhxpO0hyvFDnlXg8ZA"]
        }
    end

    # 50 Aptos Grant Projects
    def get("5") do
        %__MODULE__{
            title: "Research on 50 Aptos Grant Projects, Writing Project Introductions in Chinese and English, and Advancing the Internationalization of NonceGeek DAO Brand",
            index: "5",
            dorahacks_id: "328",
            category: "Writing",
            details: "Research on 50 Aptos Grant Projects, Writing Project Introductions in Chinese and English, and Advancing the Internationalization of NonceGeek DAO Brand. APT Price: 7.14, 50 * 7.14 = 357 USDT",
            finishers: ["aryaaaaaaaaaaaaaaa"], 
            finished_proof: ["https://mp.weixin.qq.com/s/j4gYKTqHFoTml_pn0EtDFA"]
        } 
    end

    # Moveflow
    def get("6") do
        %__MODULE__{
            title: "Write an article about the introduction of MoveFlow",
            index: "6",
            dorahacks_id: "329",
            category: "Writing",
            details: "Write an article about the introduction of MoveFlow, 8 APT * 7 = 56 USDT.",
            finishers: ["albinlau"], 
            finished_proof: ["https://mp.weixin.qq.com/s/lkv9sAiJ-vGHkaJLzVrSTg"]
        } 
    end


    # scaffold-aptos
    def get("7") do
        %__MODULE__{
            title: "Solve the static resources issue in dApp",
            index: "7",
            dorahacks_id: "330",
            category: "Coding",
            details: "Solve the static resources issue in dApp",
            finishers: [], 
            finished_proof: []
        } 
    end
end
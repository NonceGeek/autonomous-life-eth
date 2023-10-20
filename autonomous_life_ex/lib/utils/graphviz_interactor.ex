defmodule GraphvizInteractor do
    alias Graphvix.Graph

    def new() do
        graph = Graph.new()
    end

    def draw_rec(graph, text) do
        Graph.add_vertex(graph, text, shape: "polygon", sides: 4)
    end
end
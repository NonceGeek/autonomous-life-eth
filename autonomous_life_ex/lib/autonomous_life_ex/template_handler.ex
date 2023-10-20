defmodule AutonomousLifeEx.TemplateHandler do
    alias AutonomousLifeEx.SmartPrompterInteractor

  def gen_prompt(template_content, the_map) do
      Enum.reduce(the_map, template_content, fn {key, value}, acc ->
          key_str = Atom.to_string(key)
          # IO.puts "{#{key_str}}"
          String.replace(acc, "{#{key_str}}", value)
      end)
  end

  def find_role() do
    endpoint = Constants.smart_prompter_endpoint()
    {:ok, %{data: templates}} = SmartPrompterInteractor.list_template(endpoint)
    Enum.find(templates, fn template ->
      template.title == "GenerateGameRole"
    end)
  end
end
defmodule Exchange.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Exchange.ID, []),
      worker(Exchange.Engine, [Exchange.Engine]),
    ]

    opts = [strategy: :one_for_one, name: Temp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

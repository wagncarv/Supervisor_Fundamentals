defmodule SupervisorFundamentals do
  use GenServer

  # SERVER

  def init({idade, salario}) do
    IO.inspect("Iniciando carreira ...")
    {:ok, {idade, salario}}
  end

  def terminate(_motivo, _state) do
    IO.inspect "não trabalho mais"
    :error
  end

  def start_link({nome, idade, salario}) do
    GenServer.start_link(__MODULE__, {idade, salario}, name: nome )
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:upgrade, idade, aumento}, state) do
    {_, salario} = state
    {:noreply, {idade, salario + aumento}}
  end

  def handle_cast(:aposenta, state) do
    raise "Aposentando #{state}"
    {:noreply, state}
  end

  # CLIENT

  def busca_pessoa(nome), do: GenServer.call(nome, :get)
  def promocao(nome, idade, salario) do
    GenServer.cast(nome, {:upgrade, idade, salario})
  end

  def aposenta(nome) do
    GenServer.cast(nome, :aposenta)
  end


end

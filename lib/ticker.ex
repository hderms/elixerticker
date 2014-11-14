defmodule Ticker do

  def init(receivers) do
    tick(receivers)
  end

  def tick(receivers) do
    :timer.sleep(1000)
    Enum.each(receivers, fn(receiver) -> send(receiver, {:tick, "tick"}) end)
    tick(receivers)
  end
  def exit() do
    Process.exit(self, "Normal error")
  end

end
defmodule Printer do
  def init() do
    receive_msg
  end
  def receive_msg() do
    receive do
      {:tick, msg} -> IO.puts msg
    end
    receive_msg
  end
end

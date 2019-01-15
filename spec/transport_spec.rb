require_relative "../lib/transport.rb"

describe CSVM::Transport do
  it "tracks PIDs" do
    t = CSVM::Transport.new
    expect(t.pid).to eq(Process.pid)
  end
end

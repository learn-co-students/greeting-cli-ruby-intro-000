require_relative "../lib/greeting.rb"

describe './bin/greet executing a CLI Application' do

  it 'uses #gets.strip to capture the user input and set it equal to a variable called name' do
    allow($stdout).to receive(:puts)

    expect(self).to receive(:gets).and_return("Don")
    name = get_variable_from_file("./bin/greet", "name")

    expect(name).to eq("Don")
  end

  it "calls on the #greeting method with an argument of the user's name" do
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")

    expect(self).to receive(:greeting).with("Don"), "Make sure the bin/greet file has code that calls the #greeting method with an argument of the user's name."

    run_file("./bin/greet")
  end

  it "calls on the #greeting method with an argument of the user's name and returns the new greeting, interpolating the user's name" do
    allow($stdout).to receive(:puts)
    allow(self).to receive(:gets).and_return("Don")

    output = capture_puts{ run_file("./bin/greet") }

    expect(output).to include("Hello Don. It's nice to meet you.")
  end
end

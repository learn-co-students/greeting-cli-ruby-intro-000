require_relative "../lib/greeting.rb"

describe './lib/greeting.rb' do
  it 'defines a greeting method' do
    expect(defined?(greeting)).to be_truthy
  end

  context '#greeting' do
    it 'takes in an argument of a persons name' do
      allow($stdout).to receive(:puts)
      
      expect{greeting("Bobby")}.to_not raise_error
    end

    it 'greets the person whose name was passed in as an argument' do
      allow($stdout).to receive(:puts)

      output = capture_puts{ greeting("Sally") }

      expect(output).to include("Hello Sally. It's nice to meet you.")
    end

    it 'greets the person with additional whitespace removed' do
      allow($stdout).to receive(:puts)

      output = capture_puts{ greeting("Sally") }

      # puts adds a newline to the output. Without using print, students
      # will not be able to remove the \n character at the end of the phrase
      # Strip is being used on the output for this purpose
      expect(output.strip).to eq("Hello Sally. It's nice to meet you.")
    end
  end
end

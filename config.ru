
app = lambda do |env|
	p env
	
	callback = proc do |stream|
		binding.irb
	end
	
	[101, {'rack.hijack' => callback, 'upgrade' => 'text'}, nil]
end

run app

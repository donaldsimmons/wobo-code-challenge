class Hello
	def self.call(env)
		[200,
		 { "Content-Type" => "text/plain" },
		 ["#{env.inspect}"]
		]
	end
end

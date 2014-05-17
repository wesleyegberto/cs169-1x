class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s # make sure it's a string
		attr_reader attr_name # create the attribute's getter
		attr_reader attr_name+"_history" # create bar_history getter
		attr_hist = attr_name+"_history"
		class_eval %Q{
			@#{attr_hist} = nil
			def #{attr_name}=(#{attr_name})
				if @#{attr_hist} == nil
					@#{attr_hist} = Array.new
				end
				@#{attr_hist} << @#{attr_name}
				@#{attr_name} = #{attr_name}
			end
		}
	end
end
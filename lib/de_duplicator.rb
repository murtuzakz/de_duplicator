class DeDuplicator
	
	attr_accessor :base_list, :new_additions

	def initialize( base_list=[] )
		@base_list = base_list.flatten.uniq
    @new_additions = []
	end

	def update_base_list(list)
    flat_list = list.flatten
    @new_additions = flat_list - (@base_list & flat_list)
		@base_list = (@base_list + @new_additions).flatten.uniq
	end

	def unique_list
		base_list
	end

	def get_duplicates(list)
    flat_list = list.flatten
		duplicates = (@base_list & flat_list)
		update_base_list(flat_list)
		duplicates
  end

  def remove_recent_additions!
    @base_list -= @new_additions
  end

  def clear!
  	@base_list = []
  	@new_additions = []
  	return self
  end
end
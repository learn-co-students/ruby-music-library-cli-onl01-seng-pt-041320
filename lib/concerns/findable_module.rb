module Concerns::Findable
  # Module code here
    def find_by_name(name)
        self.all.detect{|a| a.name == name}
    end
    
    def find_or_create_by_name(search)
      self.find_by_name(search) ? (search = self.find_by_name(search)) : self.create(search)
    end 

end
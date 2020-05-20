module Persistable
    module ClassMethods
        def destroy_all
            self.all.clear
        end
        def create(name)
            temp = self.new(name)
            temp.save #is there a better way to return it?
            temp
        end
    end

    module InstanceMethods
        def save
            self.class.all << self
        end
    end

end
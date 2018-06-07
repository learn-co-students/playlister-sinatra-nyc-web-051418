module Slug
  def slug
    split_name = name.split
    slugified = split_name.join("-").downcase
  end


  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |item|
        item.slug == slug
      end
    end
  end
end

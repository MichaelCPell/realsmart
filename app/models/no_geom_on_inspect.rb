module NoGeomOnInspect
    def inspect
      inspection = if defined?(@attributes) && @attributes
                      self.class.column_names.collect { |name|
                         if has_attribute?(name) && name != "geom"
                           "#{name}: #{attribute_for_inspect(name)}"
                         end
                       }.compact.join(", ")
                      else
                       "not initialized"
                      end
      "#<#{self.class} #{inspection}>"
  end
end
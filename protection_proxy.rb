class ProtectionProxy < BasicObject

  def self.writable(*names)
    @writable_fields = names
  end

  def self.writable_fields
    @writable_fields ||= []
  end

  def initialize(object)
    @object = object
  end

  def method_missing(sym, *args, &block)
    method_name = sym.to_s
    if ! method_name.end_with?("=")
      @object.send(sym, *args, &block)
    else
      field_name = method_name[0...-1].to_sym
      if self.class.writable_fields.include?(field_name)
        @object.send(sym, *args, &block)
      end
    end
  end



end



module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy, :disabled => f.object.new_record? && 'disabled' ) + link_to_function(name, "remove_fields(this)")
  end

 def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, '#{association}')"))
  end
end

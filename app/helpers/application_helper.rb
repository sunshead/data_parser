module ApplicationHelper
def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil #for sorting format
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc" #reverse sorting order upon second click
  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  #params.merge to keep sorting consistency when executing a search operation
end
end

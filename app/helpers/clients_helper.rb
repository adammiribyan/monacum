# encoding: utf-8

module ClientsHelper
  def dependents_count(object)
    if object and object.personal_izhd_count > 0
      "#{object.personal_izhd_count} #{Russian.p(object.personal_izhd_count, "иждивенец", "иждивенца", "иждивенцев")}"
    end
  end
  
end

# encoding: utf-8

module ClientsHelper
  def dependents_count(object)
    if object and object.personal_izhd_count > 0
      "#{object.personal_izhd_count} #{Russian.p(object.personal_izhd_count, "иждивенец", "иждивенца", "иждивенцев")}"
    end
  end
  
  # ENHANCE
  def client_address(client, type)
    case type
    when "current"
      city ||= "г. #{client.fact_city}, " if client.fact_city.present?
      street ||= "#{client.fact_street}, " if client.fact_street.present?
      house ||= "дом #{client.fact_house}, " if client.fact_house.present?
      building ||= "#{client.fact_building}, " if client.fact_building.present?
      flat ||= "кв. #{client.fact_flat}" if client.fact_flat.present?
    when "registered"
      city ||= "г. #{client.reg_city}, " if client.reg_city.present?
      street ||= "#{client.reg_street}, " if client.reg_street.present?
      house ||= "дом #{client.reg_house}, " if client.reg_house.present?
      building ||= "#{client.reg_building}, " if client.reg_building.present?
      flat ||= "кв. #{client.reg_flat}" if client.reg_flat.present?
    end
    
    "<span>#{city}</span><br /><span>#{street}</span><br /><span>#{house}</span><span>#{building}</span><span>#{flat}</span>".html_safe
  end
  
end

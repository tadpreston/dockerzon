module AccountsHelper
  def address_block address
    "<block>#{address.street_address_1}<br />#{address.street_address_2}</br />#{address.city}</br />#{address.state}</br />#{address.postal_code}</block>".html_safe
  end
end

# frozen_string_literal: true

# Helper class for parcel view
module ParcelsHelper
  def gender_options
    [
      ['Male', 'male'],
      ['Female', 'female'],
      ['Others', 'others']
    ]
  end

  def parcel_type_options
    [
      ['Pharmacuetical Drugs', 'pharma_drugs'],
      ['Sports Utilities', 'sport_utilities'],
      ['Electronics', 'electronics'],
      ['Jewellery', 'jewellery'],
      ['Clothes', 'clothes'],
      ['Machinery', 'machinery'],
      ['Others', 'others']
    ]
  end

  def payment_mode_options
    [
      ['COD', 'cod'],
      ['Prepaid', 'prepaid']
    ]
  end

  def service_mode_options
    [
      ['SpeedPost', 'speed_post'],
      ['Regular', 'regular']
    ]
  end

  def user_full_name(parcel, user_type)
    user_type_obj = parcel.users.send(user_type)
    "#{user_type_obj.first_name} #{user_type_obj.last_name}"
  end

  def user_address(parcel, user_type)
    address_obj = parcel.users.send(user_type).address
    address = []
    address << "#{address_obj.address_line1}<br/>"
    address << "#{address_obj.address_line2}<br/>" if address_obj.address_line2.present?
    address << "#{address_obj.address_line3}<br/>" if address_obj.address_line3.present?
    address << "#{address_obj.city} - #{address_obj.pincode}<br/>"
    address << "#{address_obj.state}<br/>#{address_obj.country}"
    address.join.html_safe
  end

  def current_status(parcel)
    parcel.parcel_statuses.latest.status
  end

  def update_parcel_status(key, title, parcel)
    link_to title, parcel_status_index_path(parcel_id: parcel.id, status: key), remote: true, method: :post, data: { confirm: 'Want to update status ?'} 
  end
end

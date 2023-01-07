json.extract! booking, :id, :bed_id, :checkin_date, :checkout_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)

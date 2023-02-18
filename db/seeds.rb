districts = %w[
  Mitte
  Friedrichshain-Kreuzberg
  Pankow
  Charlottenburg-Wilmersdorf
  Spandau
  Steglitz-Zehlendorf
  Tempelhof-Schöneberg
  Neukölln
  Treptow-Köpenick
  Marzahn-Hellersdorf
  Lichtenberg
  Reinickendorf
]

districts.each { |district| District.create! name: district }

facility_one =
  Facility.create! name: "Einrichtung Eins", district: District.first

facility_two =
  Facility.create! name: "Einrichtung Zwei", district: District.last
facility_three =
  Facility.create! name: "Einrichtung Drei", district: District.first

genders = %w[männlich weiblich divers]

50.times do
  Bed.create! facility: facility_one,
              permitted_genders: genders.sample(1 + rand(genders.count))
end

25.times do
  Bed.create! facility: facility_two,
              permitted_genders: genders.sample(1 + rand(genders.count))
end

15.times do
  Bed.create! facility: facility_three,
              permitted_genders: genders.sample(1 + rand(genders.count))
end

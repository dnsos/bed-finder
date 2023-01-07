facility_one = Facility.create! name: "Einrichtung Eins", district: "Mitte"

facility_two = Facility.create! name: "Einrichtung Zwei", district: "Lichtenberg"
facility_three = Facility.create! name: "Einrichtung Drei", district: "Tempelhof-Schöneberg"

genders = ["männlich", "weiblich", "divers"]

50.times do
  Bed.create! facility: facility_one, permitted_genders: genders.sample(1 + rand(genders.count))
end

25.times do
  Bed.create! facility: facility_two, permitted_genders: genders.sample(1 + rand(genders.count))
end

15.times do
  Bed.create! facility: facility_three, permitted_genders: genders.sample(1 + rand(genders.count))
end


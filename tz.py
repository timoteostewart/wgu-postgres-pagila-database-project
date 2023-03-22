from geopy.geocoders import Nominatim
import datetime
import pytz
import timezonefinder

def pretty_print_offset(utc_offset_str):
    if utc_offset_str[0] == '-':
        sign = -1.0
    else:
        sign = 1.0

    hours = float(utc_offset_str[1:3])
    
    if utc_offset_str[-2:] == '30':
        half = 0.5
    else:
        half = 0.0

    if half == 0.5:
        return float(sign * (hours + half))
    else:
        return int(sign * hours)


if __name__ == "__main__":

    with open("cities_countries.txt", mode="r", encoding="utf-8") as f:
        cities_countries = f.read().splitlines()
    
    cities_countries_tuples = []
    for each_c_c in cities_countries:
        cities_countries_tuples.append([datum.strip() for datum in each_c_c.split("|")])

    geolocator = Nominatim(user_agent="Tim Stewart")
    tf = timezonefinder.TimezoneFinder()
    for x in cities_countries_tuples:
        geo_location = ""
        try:
            geo_location = geolocator.geocode(f"{x[1]}, {x[3]}")
        except Exception as e:
            print(f"Error: {e}")
        
        if geo_location:
            tz_name = tf.timezone_at(lng=geo_location.longitude, lat=geo_location.latitude)
            utc_offset = datetime.datetime.now(pytz.timezone(tz_name)).strftime('%z')
            if x[0] == 600:
                punc = ";"
            else:
                punc = ","
            print(f"({x[0]}, '{x[1]}', {pretty_print_offset(utc_offset)}){punc}")
        else:
            print(f"geo_location couldn't be found for city with city_id = {x[0]}")

    exit()

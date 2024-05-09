

SELECT *
FROM weather_flights_x_sf AS wf;


 SELECT DISTINCT flight_date,
       origin,
       dep_time,
       MAKE_TIME((dep_time::INT / 100), (dep_time::INT % 100), 0) AS dep_time_f,
       AVG(snow) AS avg_snow
FROM weather_flights_x_sf wfxs 
GROUP BY flight_date, origin, dep_time
ORDER BY flight_date ASC;

SELECT DISTINCT flight_date, origin  , AVG(snow)
FROM weather_flights_x_sf
GROUP BY origin, flight_date
ORDER BY origin, flight_date;

# Plotting

plt.figure(figsize=(10, 6))
plt.plot(dep_times, avg_snows, marker='o', linestyle='-')
plt.xlabel('Departure Time')
plt.ylabel('Average Snowfall')
plt.title('Average Snowfall vs. Departure Time')
plt.grid(True)
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
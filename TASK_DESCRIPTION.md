At Wunder, we work with a lot of geographic coordinates to build algorithms. Hence, you'll be
asked to manipulate such data.

You first task is the following: you received two CSV files
([pairs.csv](priv/data/pairs.csv) and [coordinates.csv](priv/data/coordinates.csv))​
having the same structure (i.e. two columns: longitude and latitude).
To help our engineers, you're asked to parse those files and handle their content in
such a way:

pairs.csv​:
- Create coordinate pairs [{lon1, lat1}, {lon2, lat2}], [{lon2, lat2}, {lon3, lat3}], [{lon3,
lat3}, {lon4, lat4}], ...
- For every single pair, create a bounding box based on the two coordinates.

coordinates.csv:
- Assign every coordinate to one of the previously computed bounding boxes given
that the coordinate is inside a bounding box. If no bounding box matches, just
discard the coordinate.

Given that the first part is complete, let's get a glimpse at Wunder's heart: matching carpoolers
together. For that matter, create a module that keeps track of every bounding box previously
created and can take a pair of geographic coordinates as argument (i.e. origin and destination)
and return the matching bounding boxes (for either origin, destination or both). It should also
build and store the corresponding bounding box for each received pair.


```{r data wrangling risk factors - alleys, centroids}
alleys <-
  st_read("https://opendata.arcgis.com/datasets/dc3dc5310f1f4be7a1fa6cde59b564df_62.geojson") %>%
  filter(DESCRIPTION == "Alley")  %>%
  st_transform(st_crs(fishnet))

alleysCentroids <- alleys %>%
  st_centroid(alleys) %>%
  st_transform(st_crs(fishnet)) %>%
  dplyr::select(geometry) %>%
  st_as_sf(coords = c("X", "Y"), crs = 4326, agr = "constant") %>%
  st_transform(st_crs(fishnet)) %>%
  mutate(Legend = "Alleys")
```

```{r data wrangling risk factors - parking lots, centroids}
parking <-
  st_read("https://opendata.arcgis.com/datasets/dc3dc5310f1f4be7a1fa6cde59b564df_62.geojson") %>%
  filter(DESCRIPTION == "Parking Lot")  %>%
  st_transform(st_crs(fishnet))

parkingCentroids <- parking %>%
  st_centroid(alleys) %>%
  dplyr::select(geometry) %>%
  st_as_sf(coords = c("X", "Y"), crs = 4326, agr = "constant") %>%
  st_transform(st_crs(fishnet)) %>%
  mutate(Legend = "Parking Lots")

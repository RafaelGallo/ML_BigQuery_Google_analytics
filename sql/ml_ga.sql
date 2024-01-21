WITH data AS (
  SELECT
    -- Select your feature columns, including "visits"
    date,
    totals.pageviews AS totals_pageviews,
    totals.visits AS totals_visits,
    trafficSource.medium AS trafficSource_medium,
    visitNumber AS Visit_pag,
    channelGrouping,
    geoNetwork.continent,
    geoNetwork.city,
    geoNetwork.country AS geoNetwork_country,
    device.browser AS device_browser,
    -- Select the output variable (label)
    totals.transactionRevenue AS totals_transactionRevenue
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
)

SELECT
  -- Select your features, including "visits," and the output variable
  date,
  totals_pageviews,
  totals_visits,
  trafficSource_medium,
  channelGrouping,
  geoNetwork_country,
  device_browser,
  totals_transactionRevenue
FROM
  data
WHERE
  -- Set criteria to split the data into training and test sets
  RAND() < 0.8 -- Example: 80% of the data in the training set

UNION ALL

SELECT
  date,
  totals_pageviews,
  totals_visits,
  trafficSource_medium,
  channelGrouping,
  geoNetwork_country,
  device_browser,
  totals_transactionRevenue
FROM
  data
WHERE
  RAND() >= 0.8; -- Example: 20% of the data in the test set

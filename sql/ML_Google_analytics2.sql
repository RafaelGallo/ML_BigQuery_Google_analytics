SELECT
fullVisitorId,
visitId,
visitNumber,
hits.hitNumber AS hitNumber,
hits.page.pagePath AS pagePath

FROM
`bigquery-public-data.google_analytics_sample.ga_sessions_*`,

UNNEST(hits) as hits

WHERE
_TABLE_SUFFIX BETWEEN '20170701' AND '20170731'

AND
hits.type="PAGE"

ORDER BY
fullVisitorId,
visitId,
visitNumber,
hitNumber;
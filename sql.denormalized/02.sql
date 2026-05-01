SELECT
    tag,
    count(*) as count
FROM (
    SELECT DISTINCT
        data->>'id' AS id_tweets,
        '#' || (hashtag->>'text') AS tag
    FROM tweets_jsonb,
    jsonb_array_elements(
        COALESCE(data->'extended_tweet'->'entities'->'hashtags',
                 data->'entities'->'hashtags', '[]')
    ) AS hashtag
    WHERE data->'entities'->'hashtags' @> '[{"text":"coronavirus"}]'
       OR data->'extended_tweet'->'entities'->'hashtags' @> '[{"text":"coronavirus"}]'
) t
WHERE tag LIKE '#%'
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;

SET max_parallel_maintenance_workers = 7;
SET maintenance_work_mem = '1GB';

CREATE INDEX gin_tweets_jsonb_hashtags ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX gin_tweets_jsonb_extended_hashtags ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX gin_tweets_jsonb_text ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));
CREATE INDEX idx_tweets_jsonb_lang ON tweets_jsonb ((data->>'lang'));

SET max_parallel_maintenance_workers = 7;
SET maintenance_work_mem = '1GB';

CREATE INDEX idx_tweet_tags_tag ON tweet_tags(tag);
CREATE INDEX idx_tweet_tags_id_tweets ON tweet_tags(id_tweets);
CREATE INDEX idx_tweets_lang ON tweets(lang);
CREATE INDEX gin_tweets_text ON tweets USING gin(to_tsvector('english', text));

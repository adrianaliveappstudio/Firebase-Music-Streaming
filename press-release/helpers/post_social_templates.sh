#!/bin/bash
# post_social_templates.sh
# Prints prepared social posts (do not auto-post). Use manually or pipe to your social CLI.

cat press-release/short-social-copy.txt

echo "\n---\nTo post these automatically, integrate with your social media CLI or API (e.g., twurl, twitter-cli, Mastodon API).\nRemember: DO NOT post allegations until counsel confirms wording."

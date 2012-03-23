# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_recipe_session',
  :secret      => '63f980c08a9d5ec814b717664f88e5e41849a9a0de996b299bddccb9bf1e900f76227f9ce7e6630276a6ffe4bac1f7cbf4298dd56342b27b68c81e3ab7eb9d38'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

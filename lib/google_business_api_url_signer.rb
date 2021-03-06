require 'active_support/all'
require "google_business_api_url_signer/version"
require "google_business_api_url_signer/errors"
require "google_business_api_url_signer/signer"

module GoogleBusinessApiUrlSigner
  # Public: Adds a signature to given URL
  #
  # url           - The Google API URL you want to sign.
  #                 The URL should contain your Google client ID set as get parameter 'client'
  # private_key   - Your private key which you got from Google when signing up for the business APIs
  #                 This can be left blank if you set GoogleBusinessApiUrlSigner::Signer.default_private_key
  #
  #
  # Example
  #
  #   private_key = "my-private-key-here"
  #   url = "http://maps.googleapis.com/maps/api/geocode/json?address=New+York&sensor=false&client=clientID"
  #   GoogleBusinessApiUrlSigner.add_signature(url, private_key)
  #   # => "http://maps.googleapis.com/maps/api/geocode/json?address=New+York&sensor=false&client=clientID&signature=KrU1TzVQM7Ur0i8i7K3huiw3MsA="
  #
  def add_signature(url, private_key = nil)
    Signer.new(url: url, private_key: private_key).signed_url
  end

  extend self
end

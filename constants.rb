require 'oj'

module Blitline
  module Constants
  	SRC_TYPE_IMAGE = 'image'
  	SRC_TYPE_SCREEN_SHOT = 'screen_shot_url'
  	SRC_TYPE_MULTI_PAGE = 'multi_page'
    SRC_TYPE_BURST_PDF = 'burst_pdf'
    SRC_TYPE_PREPROCESS_ONLY = 'pre_process_only'
    SRC_TYPE_GIF = 'gif'
    SRC_TYPE_INLINE = 'inline'
    SRC_TYPE_ZIP = 'zip'
    SRC_TYPE_BATIK_VECTORS = [".svg"]


  	LOCAL_JOB_EXECUTION_VERSION = 2
  	TEST_JOB_EXECUTION_VERSION = 1.5
    TEST_JOB_NAME = "test_job"
    API_HOSTNAME = "api.blitline.com"

    
    HOSTNAME = `hostname` || "unknown"
    puts "Hostname = #{HOSTNAME}"
    puts "Libyaml = #{Psych::LIBYAML_VERSION}" if defined?(Psych)

    # Private DATA
    # ------------------------------------------------------------
    unless ENV['BLITLINE_CONFIG']
      puts "Missing BLITLINE_CONFIG file"
      Kernel.exit!
    end

    config_file = IO.read(ENV['BLITLINE_CONFIG'])
    BLITLINE_CONFIG =Oj.load(config_file)

    CACHE_USERNAME = BLITLINE_CONFIG["CACHE_USERNAME"] # Long polling Cache
    CACHE_PASSWORD = BLITLINE_CONFIG["CACHE_PASSWORD"] # Long polling Cache Password
    HOST =  BLITLINE_CONFIG["HOST"] # Beanstalkd Host
    SECOND_HOST = BLITLINE_CONFIG["SECOND_HOST"] # Second Beanstalkd Host
    DEFAULT_BEANSTALK_POOL = [HOST, SECOND_HOST]
    DEFAULT_BEANSTALK_POOL_NAME = BLITLINE_CONFIG["DEFAULT_BEANSTALK_POOL_NAME"]
    DEFAULT_LONG_RUNNING_BEANSTALK_POOL_NAME = BLITLINE_CONFIG["DEFAULT_LONG_RUNNING_BEANSTALK_POOL_NAME"]
    IMAGGA_POOL = BLITLINE_CONFIG["IMAGGA_POOL"] # Imagga beanstalkd
    IMAGGA_QUEUE_NAME = BLITLINE_CONFIG["IMAGGA_QUEUE_NAME"] 
    IMAGGA_NAME = BLITLINE_CONFIG["IMAGGA_QUEUE_NAME"]
    SET_USAGE_URL = BLITLINE_CONFIG["SET_USAGE_URL"] # Blitline usage url
    SDB_CLIENT_KEY = BLITLINE_CONFIG["SDB_CLIENT_KEY"] # Mongo Client KEY
    MONGO_SERVER =  BLITLINE_CONFIG["MONGO_SERVER"]
    AES_KEY = BLITLINE_CONFIG["AES_KEY"] # AES Encryption KEY
    BLITLINE_AES_KEY = BLITLINE_CONFIG["BLITLINE_AES_KEY"] # AES Encryption KEY
    AWS_ACCESS_KEY = BLITLINE_CONFIG["AWS_ACCESS_KEY"]
    AWS_ACCESS_SECRET = BLITLINE_CONFIG["AWS_ACCESS_SECRET"]

    MONGO_DB_PASSWORD = BLITLINE_CONFIG["MONGO_DB_PASSWORD"]
    MONGO_DB_NAME = BLITLINE_CONFIG["MONGO_DB_NAME"]
    MONGO_DB_PORT = BLITLINE_CONFIG["MONGO_DB_PORT"]
  end
end

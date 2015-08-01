class PsdJob
  # extend Resque::Plugins::History
  
  @queue = :worker

  def self.perform(upload_id)
    upload = Upload.find upload_id
    # download and parse the file
  end
end
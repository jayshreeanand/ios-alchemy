class ExtractJob
  # extend Resque::Plugins::History
  
  @queue = :worker

  def self.perform(design_id)
    PsdUtils::Resize.run design_id
  end
end
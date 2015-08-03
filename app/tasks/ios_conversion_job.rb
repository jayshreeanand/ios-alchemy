class IosConversionJob
  
  @queue = :worker

  def self.perform(design_id)
    IosUtils::DataFormatter.run design_id
  end
end
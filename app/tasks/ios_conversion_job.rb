class IosConversionJob
  
  @queue = :worker

  def self.perform(design_id)
    IosUtils::Converter.run design_id
  end
end
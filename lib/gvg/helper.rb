class Gvg::Helper
  def self.get_resource_dir
    File.join(File.dirname(File.expand_path(__FILE__)), '../../resources')
  end

  def self.get_voicexml21_schema_dir
    File.join(Gvg::Helper.get_resource_dir(), 'voicexml21', 'schema')
  end
end


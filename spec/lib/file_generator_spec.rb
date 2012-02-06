require 'spec_helper'

describe FileGenerator do
  context "generating file" do

    let(:file_generator) do
      records = [{"id"=>1, "region_id"=>7, "name"=>"les Escaldes"},{"id"=>2, "region_id"=>7, "name"=>"Lima"}]
      format = load_formats.formats
      f = FileGenerator::Base.new
      f.generate_file(records,format['headerformat'],format['bodyformat'],format['footerformat'])
      #raise f.generate_file(records,format['headerformat'],format['bodyformat'],format['footerformat']).inspect
    end

    it "should not be empty string" do
      file_generator.should_not be_empty
    end

    it "header should be match the format" do
      header = file_generator.split("\n")[0]
      header.should match "CC193" + Time.now.strftime("%Y%m%d").to_s
    end

    it "footer should be match the format" do
      footer = file_generator.split("\n")[3]
      footer.should match "CC1930000000002"
    end

    it "first line body should be match format" do
      body = file_generator.split("\n")[1]
      body.should match "001les Escaldes                  007"
    end

    it "second line body should be match format" do
      body = file_generator.split("\n")[2]
      body.should match "002Lima                          007"
    end

  end

end


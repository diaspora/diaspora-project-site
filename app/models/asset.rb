class Asset < ActiveRecord::Base
  has_attached_file :file, {
    :path => ":rails_root/public/:class/:style/:filename",
    :url => "/:class/:style/:filename",
    :styles => { :large => "800x800>", :medium => "300x300>", :thumb => "100x100>" }
  }
  before_post_process :skip_for_non_images

  do_not_validate_attachment_file_type :file

  validates :file, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :file

  private

  def skip_for_non_images
    (file.content_type =~ /^(image|(x-)?application)\/(x-png|pjpeg|jpeg|jpg|png|gif)$/)
  end
end

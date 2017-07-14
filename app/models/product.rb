class Product < ApplicationRecord
  has_many :order_items
  has_attached_file :image,
                  styles: { thumb: ["100x100#", :jpg],
                            original: ['500x500>', :jpg] },
                  convert_options: { thumb: "-quality 100 -strip",
                                     original: "-quality 100 -strip" }

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


end

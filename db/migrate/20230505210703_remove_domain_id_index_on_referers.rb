class RemoveDomainIdIndexOnReferers < ActiveRecord::Migration[7.0]
  def change
    remove_index 'land.referers', column: :domain_id if index_exists?('land.referers', :domain_id)
  end
end

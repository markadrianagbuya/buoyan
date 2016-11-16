class AddUnlimitedClassPassPackage < ActiveRecord::Migration[5.0]
  def change
    joyce = Student.find_by(name: "Joyce")
    unlimited_package = Package.where(name: "Unlimited Class Pass").first_or_create
    Purchase.where(package_id: unlimited_package.id, student_id: joyce.id).first_or_create
  end
end

class Attendee
  def initialize(student, attendance)
    @student = student
    @attendance = attendance
  end

  attr_accessor :student, :attendance

  def to_s
    [
      student.name,
      class_pass_details
    ].compact.join(' ')
  end

  private

  def class_pass_details
    return if has_unlimited_passes?
    "(#{student.passes_remaining} passes remaining)"
  end

  def has_unlimited_passes?
    Purchase.exists?(package_id: Package.find_by(name: "Unlimited Class Pass").id, student_id: student.id)
  end

  def method_missing(method, *args)
    if student.respond_to?(method)
      student.send(method, *args)
    else
      super
    end
  end
end

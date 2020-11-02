require 'rails_helper'

describe TeacherFacade do
  it "returns student user object" do
    uid = 123456789
    teacher = TeacherFacade.find(uid)

    expect(teacher).to be_a(Teacher)
    expect(teacher.id).to be_a(String)
    expect(teacher.provider).to be_a(String)
    expect(teacher.uid).to be_a(String)
    expect(teacher.email).to be_a(String)
    expect(teacher.token).to be_a(String)
    expect(teacher.first_name).to be_a(String)
    expect(teacher.last_name).to be_a(String)
  end
end

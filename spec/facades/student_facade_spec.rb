require 'rails_helper'

describe StudentFacade do
  it "returns student user object" do
    uid = 123456789
    student = StudentFacade.find(uid)

    expect(student).to be_a(Student)
    expect(student.id).to be_a(String)
    expect(student.provider).to be_a(String)
    expect(student.uid).to be_a(String)
    expect(student.email).to be_a(String)
    expect(student.token).to be_a(String)
    expect(student.first_name).to be_a(String)
    expect(student.last_name).to be_a(String)
  end
end

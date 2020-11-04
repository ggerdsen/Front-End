require 'rails_helper'

describe StudentFacade do
  it "returns student user object" do
    uid = 1
    response = File.read("spec/fixtures/student.json")
    stub_request(:get, "https://git.heroku.com/polar-anchorage-12813.git/api/v1/students/find/#{uid}").to_return(status: 200, body: response, headers: {})
    student = StudentFacade.find(uid)

    expect(student).to be_a(Student)
    expect(student.id).to be_an(Integer)
    expect(student.provider).to be_a(String)
    expect(student.uid).to be_a(String)
    expect(student.email).to be_a(String)
    expect(student.token).to be_a(String)
    expect(student.first_name).to be_a(String)
    expect(student.last_name).to be_a(String)
  end
end

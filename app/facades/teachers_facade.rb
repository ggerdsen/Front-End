class TeachersFacade
  def self.get_all_courses(id)
    teacher = TeachersService.get_teacher(id)
    json = TeachersService.get_all_courses(teacher)
    @courses = json[:data].map do |course_data|
      Course.new(course_data)
    end
  end

  def self.post_new_course(data, id, teacher_id)
    teacher = get_teacher(teacher_id)
    teacher_course_creation_params = {
      name: data[:name],
      teacher_id: teacher[:data][:id].to_i,
      school_name: data[:school_name]
    }
    TeachersService.create_course(teacher_course_creation_params, id)
  end

  def self.get_teacher(id)
    TeachersService.get_teacher(id)
  end

  def self.edit_course(id)
    course_data = TeachersService.edit_course(id)
    Course.new(course_data)
  end

  def self.update_course(id, data)
    course_data = TeachersService.update_course(id, data)
    Course.new(course_data)
  end

  def self.destroy_course(id)
    TeachersService.destroy_course(id)
  end
end

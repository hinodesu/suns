require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_submission_url
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post submissions_url, params: { submission: { class_room: @submission.class_room, deadline: @submission.deadline, filename: @submission.filename, grade: @submission.grade, student10: @submission.student10, student11: @submission.student11, student12: @submission.student12, student13: @submission.student13, student14: @submission.student14, student15: @submission.student15, student16: @submission.student16, student17: @submission.student17, student18: @submission.student18, student19: @submission.student19, student1: @submission.student1, student20: @submission.student20, student21: @submission.student21, student22: @submission.student22, student23: @submission.student23, student24: @submission.student24, student25: @submission.student25, student26: @submission.student26, student27: @submission.student27, student28: @submission.student28, student29: @submission.student29, student2: @submission.student2, student30: @submission.student30, student31: @submission.student31, student32: @submission.student32, student33: @submission.student33, student34: @submission.student34, student35: @submission.student35, student36: @submission.student36, student37: @submission.student37, student38: @submission.student38, student39: @submission.student39, student3: @submission.student3, student40: @submission.student40, student4: @submission.student4, student5: @submission.student5, student6: @submission.student6, student7: @submission.student7, student8: @submission.student8, student9: @submission.student9, subject: @submission.subject, title: @submission.title } }
    end

    assert_redirected_to submission_url(Submission.last)
  end

  test "should show submission" do
    get submission_url(@submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_submission_url(@submission)
    assert_response :success
  end

  test "should update submission" do
    patch submission_url(@submission), params: { submission: { class_room: @submission.class_room, deadline: @submission.deadline, filename: @submission.filename, grade: @submission.grade, student10: @submission.student10, student11: @submission.student11, student12: @submission.student12, student13: @submission.student13, student14: @submission.student14, student15: @submission.student15, student16: @submission.student16, student17: @submission.student17, student18: @submission.student18, student19: @submission.student19, student1: @submission.student1, student20: @submission.student20, student21: @submission.student21, student22: @submission.student22, student23: @submission.student23, student24: @submission.student24, student25: @submission.student25, student26: @submission.student26, student27: @submission.student27, student28: @submission.student28, student29: @submission.student29, student2: @submission.student2, student30: @submission.student30, student31: @submission.student31, student32: @submission.student32, student33: @submission.student33, student34: @submission.student34, student35: @submission.student35, student36: @submission.student36, student37: @submission.student37, student38: @submission.student38, student39: @submission.student39, student3: @submission.student3, student40: @submission.student40, student4: @submission.student4, student5: @submission.student5, student6: @submission.student6, student7: @submission.student7, student8: @submission.student8, student9: @submission.student9, subject: @submission.subject, title: @submission.title } }
    assert_redirected_to submission_url(@submission)
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete submission_url(@submission)
    end

    assert_redirected_to submissions_url
  end
end

require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "notify_question_author" do

    question = Question.create email: 'question_author@example.com', body: 'a test question'
    answer = Answer.create email: 'answer_author@example.com', body: 'a test body', question_id: question.id

    mail = MainMailer.notify_question_author(answer)
    assert_equal "New answer to your question", mail.subject

    assert_equal [question.email], mail.to
    assert_equal [answer.email], mail.from

    assert_match answer.body, mail.body.encoded

  end

end

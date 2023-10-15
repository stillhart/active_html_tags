require 'test_helper'

class ActiveHtmlTagsTest < ActiveSupport::TestCase
  include ApplicationHelper
  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::TagHelper
  include ActiveHtmlTags
  test 'it has a version number' do
    assert ActiveHtmlTags::VERSION
  end
  test 'creates span tags' do
    assert_equal span('content'), '<span>content</span>'
  end
  test 'creates span tags with multiple strings' do
    assert_equal span('content', 'more content'), '<span>content more content</span>'
  end
  test 'creates span tags with multiple strings in an array' do
    assert_equal span('content', ['a lot', 'more content']), '<span>content a lot more content</span>'
  end
  test 'creates span tags with style' do
    assert_equal span('content', style: 'color: periwinkle'), '<span style="color: periwinkle">content</span>'
    assert_equal span('content', style: ['color: periwinkle', 'background-color: cyan']),
                 '<span style="color: periwinkle ; background-color: cyan">content</span>'
    assert_equal span('content', style: { color: 'periwinkle', 'background-color' => :cyan }),
                 '<span style="color: periwinkle ; background-color: cyan">content</span>'
    # TODO, convert _ to -
    # assert_equal span("content", style: {color: "periwinkle", background_color: :cyan}), '<span style="color: periwinkle ; background-color: cyan">content</span>'
  end
  test 'creates span tags with js' do
    # TODO: html_safe, yes or no? onclick is always dangerous so can I expect the developer to know this?
    assert_equal span('content', onclick: "alert('Am I a bad person for using inline js?')".html_safe),
                 '<span onclick="alert(\'Am I a bad person for using inline js?\')">content</span>'
    assert_equal span('content', onclick: ["alert('Am I a bad person for using inline js?')".html_safe, true]),
                 '<span onclick="alert(\'Am I a bad person for using inline js?\') ; true">content</span>'
    assert_equal span('content', onclick: { helpful: "alert('Am I a bad person for using inline js?')".html_safe, data_structures: true }),
                 '<span onclick="alert(\'Am I a bad person for using inline js?\') ; true">content</span>'
  end
  test 'creates nested span tags' do
    assert_equal span(span('content')), '<span><span>content</span></span>'
  end
  test 'creates span tags using do..end' do
    # TODO: maybe include view/render helper?
    # assert_equal (span do "content" end), "<span><span>content</span></span>"
  end
end

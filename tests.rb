require 'minitest/autorun'
require 'string_to_date'
require 'object_tap_result'
require 'object_default'

class Test < Minitest::Test
  def setup
    @oks = [
      ["2016-02-29", Date.new(2016,2,29)],
      ["2016-02-29\n", Date.new(2016,2,29)],
      ["1996-11-04", Date.new(1996, 11, 4)],
      ["9999-11-04", Date.new(9999, 11, 4)],
      ["0000-11-04", Date.new(0, 11, 4)]
    ]

    @bads = [
      "2015-02-29",
      "2015-02-01  ABCD",
      "ABCD 2015-02-01",
      "2015-13-01",
      "2015-11-31",
      "2015-10-35",
      "No even close\nNope.\n"
    ]
  end

  def test_string_to_date_decode_oks
    @oks.each do |text, date|
      assert_equal text.to_date, date
      assert_equal text.to_date_nil, date
    end
  end

  def test_string_to_date_error_on_bads
    @bads.each do |text|
      e = assert_raises(ArgumentError) do
        text.to_date
      end
      assert_equal e.message, "invalid date"
      assert_nil text.to_date_nil
    end
  end

  def test_object_tap_result
    assert_equal "abc".tap_result{|x| x.length}, 3
  end

  def test_object_default
    assert_equal "abc".match(/d/).default(3), 3
    assert_equal "abc"[/b/].default(3), "b"
  end

end

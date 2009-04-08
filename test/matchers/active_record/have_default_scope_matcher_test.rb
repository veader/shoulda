require File.join(File.dirname(__FILE__), '..', '..', 'test_helper')

class HaveDefaultScopeMatcherTest < Test::Unit::TestCase # :nodoc:

  context 'an attribute with default scope' do
    setup do
      define_model :person, {:name => :string, :visible => :boolean} do
        # TODO: add this back in when rails version is updated
        # default_scope :conditions => {:visible => true}
      end
      @model = Person.new
    end

    should 'be true once rails version included in repo is upgraed' do
      assert true
    end

    # should 'accept having a default scope with the correct signature' do
    #   assert_accepts have_default_scope(:conditions => {:visible => true}), @model
    # end
  end

end

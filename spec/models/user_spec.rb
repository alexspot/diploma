require 'spec_helper'

describe User do
  describe 'validations' do
    context 'when correct data given' do
      it 'should be valid' do
        post = Post.new(title: 'Hello wordl', content: 'Lorem ipsum')
        post.valid?.should be_true
      end
    end
  end
end

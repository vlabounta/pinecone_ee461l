require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)  { 'Pinecone' }
    let(:title)    { 'Home' }

    it_should_behave_like "all static pages"
  end
end

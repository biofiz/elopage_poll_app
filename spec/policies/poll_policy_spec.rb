require 'rails_helper'

describe PollPolicy do
  let(:poll) { FactoryBot.create :poll }
  subject { described_class.new(user, poll) }

  shared_examples 'different users' do |action|
    context 'when user is the poll owner' do
      let(:user) { poll.user }

      it 'displays poll' do
        expect(subject).to permit_action(action)
      end
    end

    context 'when user is not the poll owner' do
      let(:user) { FactoryBot.create :user }

      it 'displays poll' do
        expect(subject).to_not permit_action(action)
      end
    end
  end

  shared_examples 'different participants' do |action|
    let(:user) { poll.user }

    context 'when there are no answers yet' do
      it 'allows to edit' do
        expect(subject).to permit_action(action)
      end
    end

    context 'when there are answers' do
      before { FactoryBot.create :answer, poll: poll }

      it "doesn't allow to edit" do
        expect(subject).to_not permit_action(action)
      end
    end
  end

  describe '#show?' do
    it_behaves_like 'different users', :show
  end

  describe '#edit?' do
    it_behaves_like 'different users', :edit
    it_behaves_like 'different participants', :edit
  end

  describe '#update' do
    it_behaves_like 'different users', :update
    it_behaves_like 'different participants', :update
  end

  describe '#vote' do
    let(:user) { poll.user }

    context 'when user has already voted' do
      before { FactoryBot.create :answer, poll: poll, user: user }

      it "doesn't allow to vote again" do
        expect(subject).to_not permit_action(:vote)
      end
    end

    context 'when user has not voted yet' do
      it 'allows to vote' do
        expect(subject).to permit_action(:vote)
      end
    end
  end
end

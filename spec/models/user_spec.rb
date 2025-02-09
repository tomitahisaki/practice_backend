# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  email      :string(255)      not null
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    build(
      :user,
      first_name:,
    )
  end

  describe 'validation' do
    subject { user.valid? }

    context 'first_name' do
      context '10文字の時' do
        let(:first_name) { 'a' * 10 }

        it 'trueを返す' do
          is_expected.to eq(true)
        end
      end
      context '11文字の時' do
        it 'falseを返し、エラーメッセージを返す' do
          @user = FactoryBot.build(:user)
          @user.first_name = 'あいうえおかきくけこさ'
          expect(@user).to be_invalid

          expect(@user.errors.full_messages).to eq(['First name is too long (maximum is 10 characters)'])
        end
      end
      context 'nilの時' do
        it 'falseを返す' do
          @user = FactoryBot.build(:user)
          @user.first_name = nil
          expect(@user).to be_invalid
        end
      end
      context '空文字の時' do
        it 'falseを返す' do
          @user = FactoryBot.build(:user)
          @user.first_name = ''
          expect(@user).to be_invalid
        end
      end
    end
  end

  describe '#full_name' do
    subject { user.full_name }
    context 'first_nameとlast_nameがある時' do
      let(:first_name) { 'Yamada' }
      it '名前と苗字を結合して返す' do
        is_expected.to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end
end

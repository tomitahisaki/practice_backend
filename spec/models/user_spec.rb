# frozen_string_literal: true

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
      first_name:
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
        let(:first_name) { 'a' * 11 }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['First nameは10文字以内で入力してください'])
        end
      end
      context 'nilの時' do
        let(:first_name) { nil }

        it 'falseを返す' do
          expect(subject).to eq(false)
        end
      end
      context '空文字の時' do
        let(:first_name) { '' }

        it 'falseを返す' do
          expect(subject).to eq(false)
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

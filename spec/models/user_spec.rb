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
      first_name:,
      last_name:,
      email:,
      age:
    )
  end

  let(:first_name) { 'first_name' }
  let(:last_name) { 'last_name' }
  let(:email) { 'sample@example.com' }
  let(:age) { 20 }

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

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['First nameを入力してください'])
        end
      end
      context '空文字の時' do
        let(:first_name) { '' }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['First nameを入力してください'])
        end
      end
    end

    context 'last_name' do
      context '10文字の時' do
        let(:last_name) { 'a' * 10 }

        it 'trueを返す' do
          expect(subject).to eq(true)
        end
      end
      context '11文字の時' do
        let(:last_name) { 'a' * 11 }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Last nameは10文字以内で入力してください'])
        end
      end
      context 'nilの時' do
        let(:last_name) { nil }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Last nameを入力してください'])
        end
      end
      context '空文字の時' do
        let(:last_name) { '' }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Last nameを入力してください'])
        end
      end
    end

    context 'email' do
      context '認められたformatではない時' do
        let(:email) { 'example-example.com' }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Emailは不正な値です'])
        end
      end
      context 'nilの時' do
        let(:email) { nil }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(%w[Emailを入力してください Emailは不正な値です])
        end
      end
      context '空文字の時' do
        let(:email) { '' }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(%w[Emailを入力してください Emailは不正な値です])
        end
      end
      context 'emailが重複した時' do
        before do
          create(:user, email: 'sample@example.com')
        end

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Emailはすでに存在します'])
        end
      end
    end

    context 'age' do
      context '0の時' do
        let(:age) { 0 }

        it 'trueを返す' do
          expect(subject).to eq(true)
        end
      end
      context '-1の時' do
        let(:age) { -1 }

        it 'falseを返して、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Ageは0以上の値にしてください'])
        end
      end
      context '文字列の時' do
        let(:age) { 'a' }

        it 'falseを返し、エラーメッセージを返す' do
          expect(subject).to eq(false)
          expect(user.errors.full_messages).to eq(['Ageは数値で入力してください'])
        end
      end
      context 'nilの時' do
        let(:age) { nil }

        it 'trueを返す' do
          expect(subject).to eq(true)
        end
      end
      context '空文字の時' do
        let(:age) { '' }

        it 'trueを返す' do
          expect(subject).to eq(true)
        end
      end
    end
  end

  describe '#full_name' do
    subject { user.full_name }

    context 'first_nameとlast_nameがある時' do
      it '名前と苗字を結合して返す' do
        is_expected.to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
end

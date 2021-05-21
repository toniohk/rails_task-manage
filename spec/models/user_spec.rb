require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:work_focus) }
  it { should validate_presence_of(:status) }
  it { should have_many(:tasks) }
  it { should have_many(:projects) }
end

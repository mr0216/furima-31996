require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入ができるとき' do
    it 'tokenと配送先の郵便番号と都道府県、市区町村、番地、建物名、電話番号が入力されていれば保存される' do
      expect(@order_address).to be_valid
    end
    it '建物名がなくても保存ができること' do
      @order_address.building = ""
      expect(@order_address).to be_valid
    end
  end
  describe '購入ができないとき' do
    # 購入入力欄が空のとき(nil)▼
    it '郵便番号が空では購入できないこと' do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県が空では購入できないこと' do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select")
    end
    it '市区町村が空では購入できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入できないこと' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では購入できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    
    # 指定の入力の値での入力確認▼
    it '郵便番号はハイフンが含まれないと購入できないこと' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end 
    it '電話番号は数字以外は登録されないこと' do
      @order_address.phone_number = "あいうえお"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

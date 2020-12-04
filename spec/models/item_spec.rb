require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '投稿が保存されるとき' do
    it '画像と商品名、商品説明、販売価格の入力、カテゴリー、商品状態、配送料の負担、発送元の地域、発送までの日数が選択がされていれば投稿は保存される' do
      expect(@item).to be_valid
    end
  end

  describe '投稿が保存されないとき' do
    # 投稿入力欄が空のとき▼
    it '画像が存在していないと保存されない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が存在していないと保存されない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が存在していないと保存されない' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end
    it '販売価格が存在していないと保存されない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'カテゴリーが存在していないと保存されない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select.')
    end
    it '商品状態が存在していないと保存されない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select.')
    end
    it '配送料の負担が存在していないと保存されない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage Select.')
    end
    it '発送元の地域が存在していないと保存されない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select.')
    end
    it '発送までの日数が存在していないと保存されない' do
      @item.estimated_shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Estimated shipping date Select.')
    end
    # 価格の設定▼
    it '価格が¥300~¥9,999,999の範囲でないと保存されない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格が¥300~¥9,999,999の範囲でないと保存されない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '販売価格が半角数字ではないと保存されない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'userが紐づいていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end

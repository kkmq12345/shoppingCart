require 'shoppingCart'

describe "Scenario 1" do
  before do 
    cart = ShoppingCart.new
    cart.add("ult_small")
    cart.add("ult_small")
    cart.add("ult_small")
    cart.add("ult_large")
  end

  it "will have a total cost of $94.70" do
    expect(cart.total).to_eq "$94.70"
  end

  it "will have 3 Unlimited 1GB and 1 Unlimited 5GB in the checkout cart" do
    expect(cart.items).to_eq {"Unlimited 1GB" => 3, "Unlimited 2GB" => 0, 
    "Unlimited 5GB" => 1, "1GB Data-pack" => 0}
  end
end

describe "Scenario 2" do
  before do 
    cart = ShoppingCart.new
    cart.add("ult_small")
    cart.add("ult_small")
    cart.add("ult_large")
    cart.add("ult_large")
    cart.add("ult_large")
    cart.add("ult_large")
  end

  it "will have a total cost of $209.40" do
    expect(cart.total).to_eq "$209.40"
  end

  it "will have 2 Unlimited 1GB and 4 Unlimited 5GB in the checkout cart" do
    expect(cart.items).to_eq {"Unlimited 1GB" => 2, "Unlimited 2GB" => 0, 
    "Unlimited 5GB" => 4, " GB Data-pack" => 0}
  end
end

describe "Scenario 3" do
  before do 
    cart = ShoppingCart.new
    cart.add("ult_small")
    cart.add("ult_medium")
    cart.add("ult_medium")
  end

  it "will have a total cost of $84.70" do
    expect(cart.total).to_eq "$84.70"
  end

  it "will have 1 Unlimited 1GB, 2 Unlimited 2GB and 2 1GB Data-pack in the checkout cart" do
    expect(cart.items).to_eq {"Unlimited 1GB" => 1, "Unlimited 2GB" => 2, 
    "Unlimited 5GB" => 0, "1GB Data-pack" => 2}
  end
end

describe "Scenario 4" do
  before do 
    cart = ShoppingCart.new
    cart.add("ult_large")
    cart.add("1gb", "I<3AMAYSIM")
  end

  it "will have a total cost of $31.32" do
    expect(cart.total).to_eq "$31.32"
  end

  it "will have 1 Unlimited 5GB and 1 1GB Data-pack in the checkout cart" do
    expect(cart.items).to_eq {"Unlimited 1GB" => 0, "Unlimited 2GB" => 0, 
    "Unlimited 5GB" => 1, "1GB Data-pack" => 1}
  end
end
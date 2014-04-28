require "spec_helper"

describe "concorrentes/new.html.erb" do
  it "o titulo deve ser Novo Concorrente" do
    sorteio = FactoryGirl.build(:sorteio, :id => 1)
    concorrente = FactoryGirl.build(:concorrente, :sorteio => sorteio)
    
    assign :concorrente, concorrente

    render
    rendered.should have_content 'Novo Concorrente'
  end
  
end
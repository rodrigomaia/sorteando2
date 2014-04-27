class ConcorrentesController < ApplicationController
  def new
    @concorrente = Concorrente.new
    @concorrente.sorteio = Sorteio.find(params[:sorteio_id])
  end

  def create
    @concorrente = Concorrente.new(concorrentes_params)
    if @concorrente.save
      redirect_to sorteio_path(@concorrente.sorteio_id), notice: 'Concorrente criado.'
    else
      redirect_to sorteio_path(@concorrente.sorteio_id), notice: 'Houve um erro na criação do Concorrente.'
    end
  end

  def destroy
    @concorrente = Concorrente.find(params[:id])
    sorteio_id = @concorrente.sorteio_id
    @concorrente.destroy
    
    redirect_to sorteio_path(sorteio_id)
  end
  
  private

  def concorrentes_params
    params.require(:concorrente).permit(:nome, :sorteio_id)
  end  
end

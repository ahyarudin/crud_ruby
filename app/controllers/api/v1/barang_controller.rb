module Api
    module V1
        class BarangController < ApplicationController
            def index
                @barangs = Barang.all
                render json: @barangs
            end

            def show
                @barang = Barang.find(params[:id])
                render json: @barang
            end

            def create
                @barang = Barang.new(barang_params)

                if @barang.save
                    render json: @barang
                else
                    render json: @barang.errors, status: :unprocessable_entity
                end
            end

            def update
                @barang = Barang.find(params[:id])

                if @barang.update(barang_params)
                    render json: @barang
                else
                    render json: @barang.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @barang = Barang.find(params[:id])

                if @barang.present?
                    @barang.destroy
                    render json: @barang
                else
                    render json: {error: "Barang Not Found"}
                end
            end

            def barang_params
                params.require(:barang).permit(:nama, :harga)
            end
        end
    end
end



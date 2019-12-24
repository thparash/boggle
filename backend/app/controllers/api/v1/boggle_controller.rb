module Api
  module V1
    class BoggleController < ApplicationController
      def new
        boggle_board = Boggle.new(4,4) 
        found_words = boggle_board.found_words   
        render json: {status: 'SUCCESS', message: 'Game Initialized', board: boggle_board.board, words: found_words}, status: :ok
      end
    end
  end
end

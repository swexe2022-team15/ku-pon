class SearchesController < ApplicationController
    def new
        @searches = Search.all
    end
end
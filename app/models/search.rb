class Search < ApplicationRecord

    # Function to search for companies
    def search_tours
      tours = Tour.all
      tours = tours.where(["start_location = ?", start_location]) if start_location.present?
      tours = tours.where(["price >= ?", price]) if price.present?

      return tours
    end
  end




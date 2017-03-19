class Admin::EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
end


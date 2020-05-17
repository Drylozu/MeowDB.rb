class MeowDBError < StandardError
  def initialize(message = "Unknown error")
    super(message)
  end
end
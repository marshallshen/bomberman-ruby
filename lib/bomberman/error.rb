module Bomberman
  class Error < StandardError; end

  class BadRequest < Error; end

  class Unauthorized < Error; end

  class RateLimitExceeded < Error; end

  class Forbidden < Error; end

  class NotFound < Error; end

  class NotAcceptable < Error; end

  class UnprocessableEntity < Error; end

  class InternalServerError < Error; end

  class NotImplemented < Error; end

  class BadGateway < Error; end

  class ServiceUnavailable < Error; end

  class LanguageNotSupported < Error; end
end

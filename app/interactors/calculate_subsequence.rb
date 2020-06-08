class CalculateSubsequence
  include Interactor

  def call
    if !context.string_a.is_a?(String) || !context.string_b.is_a?(String)
      context.error = 'The values are not strings'
      context.fail!
    end

    i = 0
    j = 0
    substrings = []

    while i < context.string_a.length && j < context.string_b.length
      if context.string_a[i] == context.string_b[j]
        j += 1
        substrings << i
      end
      i += 1
    end

    context.result = j == context.string_b.length
    context.substrings = substrings if context.result
  end
end

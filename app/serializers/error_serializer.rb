class ErrorSerializer
    def self.from_active_record(record)
        {
        errors: record.errors.map do |error|
            {
            status: "422",
            title: "Unprocessable Entity",
            detail: "#{error.attribute.to_s.titleize} #{error.message}"
            }
        end
        }
    end
end
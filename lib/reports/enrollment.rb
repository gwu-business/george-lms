module George
  module Reports
    class Enrollment
      attr_accessor :id, :waitlist_position, :student_gwid, :student_email_address, :student_full_name,
        :registration_status, :student_level, :credits, :notification_expires

      def initialize(attributes)
        @id = attributes[:id]
        @waitlist_position = attributes[:waitlist_position]
        @student_gwid = attributes[:student_gwid]
        @student_email_address = attributes[:student_email_address]
        @student_full_name = attributes[:student_full_name]
        @registration_status = attributes[:registration_status]
        @student_level = attributes[:student_level]
        @credits = attributes[:credits]
        @notification_expires = attributes[:notification_expires]
      end



    end
  end
end

require_relative '../../automated_init'

context "Define Methods" do
  context "Match Method Signature" do
    context "Optional Named Parameters" do
      subject_class = Controls::Subject::OptionalNamedParameters::Example
      subject = subject_class.new

      mimic = Mimic.(subject_class)

      method_name = :some_method

      context "#{method_name} method" do
        parameters_are_equal = Predicates::Method::Parameters.equal?(
          mimic, subject, method_name
        )

        test "#{method_name} parameters" do
          assert(parameters_are_equal)
        end
      end
    end
  end
end

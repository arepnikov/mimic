require_relative '../../../automated_init'

context "Recorder" do
  context "Predicates" do
    context "Invoked" do
      context "Multiple Detected" do
        invocation = Controls::Invocation.example

        context "Strict" do
          context "By Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(RecordInvocation::Error) do
                recorder.invoked?(invocation.method_name, strict: true)
              end
            end
          end

          context "By Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(RecordInvocation::Error) do
                recorder.invoked?(invocation.method_name, some_parameter: 1, strict: true)
              end
            end
          end
        end
      end
    end
  end
end

defmodule SimpleExample.Local2 do
  @moduledoc """
  Documentation for `SimpleExample`.
  """

  # using EasyRpc module for defining remote function
  use EasyRpc.DefRpc,
    otp_app: :simple_example,
    config_name: :remote_defrpc,
    # Remote module name
    module: RemoteNode.Interface,
    timeout: 1000,
    retry: 0

  defrpc :say_hello, as: :def_test
  defrpc :say_hello_to, args: 1, error_handling: true
  defrpc :say_hello_to_with_age, args: [:name, :age], as: :full_hello
  defrpc :say_hello_to_with_age, args: 2, as: :full_hello2
  defrpc :raise_exception, as: :fail, private: true
  defrpc :raise_exception_error_handling, as: :safe_raise, error_handling: true

  # in other module you can call remote function like:
  # SimpleExample.Local.say_hello()

  def hello() do
    # call remote function
    def_test()
  end

  def test_raise_exception() do
    # call remote function
    fail()
  end
end

require "dim"

default_container = Dim::Container.new
default_container.register(:auth_code) { "TESTAUTHCODE" }
AppContainer = Dim::Container.new(default_container)

AppContainer.register(:appname) { "Ignite Baltimore Speaker Proposals" }
AppContainer.register_env(:auth_code)

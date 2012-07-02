require "dim"

default_container = Dim::Container.new
AppContainer = Dim::Container.new(default_container)

AppContainer.register(:appname) { "Ignite Baltimore Speaker Proposals" }

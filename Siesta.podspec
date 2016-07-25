Pod::Spec.new do |s|

  s.name         = "Siesta"
  s.version      = "1.0-beta.8a"
  s.summary      = "Swift REST client library"

  s.description  = <<-DESC
                   An elegant abstraction for REST APIs that untangles stateful messes and drastically simplifies app code. A **resource-centric** alternative to the familiar **request-centric** approach.

                   Siesta ends the stateful headache of client-side network request management by providing an observable model of a RESTful resource’s state. The model answers three basic questions:

                   * What is the latest data for this resource, if any?
                   * Did the latest request result in an error?
                   * Is there a request in progress?

                   …then provides notifications whenever the answers to these questions change.

                   Siesta handles all the transitions and corner cases to deliver these answers wrapped up with a pretty bow on top, letting you focus on your UI.

                   ## Stats

                   * **OS:** iOS 8+, OS X / macOS 10.11+
                   * **Languages:** Written in Swift, supports apps in both Swift and Objective-C
                   * **Tool requirements:** Xcode 7, Swift 2.0
                   * **License:** MIT
                   * **Status:** Solid code, already in use on the App Store, but still classified as “beta” so we can gather feedback before locking in the API for the official 1.0 release. Please kick the tires, file issues, and send pull requests. Be bold!

                   ## Features

                   - Decouples view and model lifecycle from network request lifecycle
                   - Decouples request initiation from request configuration
                   - Eliminates error-prone state tracking logic
                   - Eliminates redundant network requests
                   - Unified handling for all errors: encoding, network, server-side, and parsing
                   - Highly extensible, multithreaded response deserialization
                   - Transparent built-in parsing (which you can turn off) for JSON, text, and images
                   - Smooth progress reporting that accounts for upload, download, _and_ latency
                   - Transparent Etag / If-Modified-Since handling
                   - Prebaked UI helpers for loading & error handling, remote images
                   - Debug-friendly, customizable logging
                   - Written in Swift with a great [Swift-centric API](https://bustoutsolutions.github.io/siesta/api/), but…
                   - …also works great from Objective-C thanks to a compatibility layer.
                   - Lightweight. Won’t achieve sentience and attempt to destroy you.
                   - [Robust regression tests](https://bustoutsolutions.github.io/siesta/specs/)
                   - [Documentation](https://bustoutsolutions.github.io/siesta/guide/)

                   ## What it doesn’t do

                   - It **doesn’t reinvent networking.** Siesta delegates network operations to your library of choice (`NSURLSession` by default, or [Alamofire](https://github.com/Alamofire/Alamofire), or inject your own [custom adapter](http://bustoutsolutions.github.io/siesta/api/Protocols/NetworkingProvider.html)).
                   - It **doesn’t hide HTTP**. On the contrary, Siesta strives to expose the full richness of HTTP while providing conveniences to simplify common usage patterns. You can devise an abstraction layer to suit your own particular needs, or work directly with Siesta’s nice APIs for requests and response entities.
                   - It **doesn’t do response ↔ model mapping.** This means that Siesta doesn’t constrain your response models, or force you to have any at all. Add a response transformer to work with your model library of choice, or work directly with parsed JSON.

                   ## Documentation

                   - **[Full README](https://github.com/bustoutsolutions/siesta)**
                   - **[User Guide](https://bustoutsolutions.github.io/siesta/guide/)**
                   - **[API documentation](https://bustoutsolutions.github.io/siesta/api/)**
                   - **[Specs](https://bustoutsolutions.github.io/siesta/specs/)**

                   DESC

  s.homepage     = "http://bustoutsolutions.github.io/siesta/"
  s.license      = "MIT"

  s.authors = { "Bust Out Solutions, Inc." => "hello@bustoutsolutions.com", "Paul Cantrell" => "https://innig.net" }
  s.social_media_url = "https://twitter.com/siestaframework"

  s.documentation_url = "https://bustoutsolutions.github.io/siesta/"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"

  s.source = { :git => "https://github.com/bustoutsolutions/siesta.git", :tag => "1.0-beta.8a" }

  s.subspec "Core" do |s|
    s.source_files = "Source/**/*"
    s.exclude_files = "**/Info*.plist"
    s.ios.resources = "Source/**/*.xib"
    s.osx.exclude_files = "Source/UI"
  end

  s.subspec "Alamofire" do |s|
    s.source_files = "Extensions/Alamofire/**/*"
    s.dependency "Siesta/Core"
    s.dependency "Alamofire", "> 2"
  end

  s.default_subspecs = 'Core'

end

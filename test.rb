require 'typhoeus'
require 'json'
response = Typhoeus::Request.new(
              "http://localhost:5000/identify_manifests",
              headers: { 'Accept-Encoding' => 'application/json', 'Content-Type' => 'application/json'},
              method: :post,
              body: JSON.dump({file_names: ["mix.exs"]})
              ).run
p response.body
p response.response_code



response = Typhoeus::Request.new(
              "http://localhost:5000/analyse_file",
              headers: { 'Accept-Encoding' => 'application/json', 'Content-Type' => 'application/json'},
              method: :post,
              body: JSON.dump({file_name: "mix.exs", file_contents: File.open("../bibliothecary/spec/fixtures/mix.exs").read})
              ).run
p response.body
p response.response_code

response = Typhoeus::Request.new(
              "http://localhost:5000/analyse_file",
              headers: { 'Accept-Encoding' => 'application/json', 'Content-Type' => 'application/json'},
              method: :post,
              body: JSON.dump({file_name: "yarn.lock", file_contents: File.open("../bibliothecary/spec/fixtures/yarn.lock").read})
              ).run
p response.body
p response.response_code

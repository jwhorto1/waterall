json.array!(@triggers) do |trigger|
  json.extract! trigger, :int, :g, :scaffold, :trigger, :int, :time, :int, :int, :string, :bool, :string, :text
  json.url trigger_url(trigger, format: :json)
end

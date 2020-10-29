class PagesController < ActionController::Base
  def index
    Land::EventType.find_or_create_by(event_type: 'test')

    @land.queue_event('test', {foo: :bar})
    render plain: "200 OK"
  end
end

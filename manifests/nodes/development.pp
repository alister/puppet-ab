node development inherits base {
  include basesw::dev
  include apache::php

  include ack_grep
  include python
  include rake

}

name "riak"
description "Role for Riak nodes."
run_list(
  "recipe[riak-ssl]"
)

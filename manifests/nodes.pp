node base {
   include ntp
   include ack_grep
   include joe
}

node oberth inherits base {
}

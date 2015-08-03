Command Line RPN
---------------------
You can start a CLI version of a RPN with `ruby rpn_cli.rb`


RESTful RPN example
---------------------

You can start a HTTP version of a RPN with `ruby rpn_as_a_service_lol.rb`  
You may need to run `bundle install`

Here is an example of how you can interact with the RPNaaS

```shell
eknecht@eknecht-mbp:~ $ curl -X PUT -d '{"expression": "20"}' -H "X-RPN-API-KEY:f03699b9b9f979905f88396666b312ed986ab2c7" http://localhost:4567/rpn/
{"result":"20.0"}
eknecht@eknecht-mbp:~ $ curl -X PUT -d '{"expression": "13"}' -H "X-RPN-API-KEY:f03699b9b9f979905f88396666b312ed986ab2c7" http://localhost:4567/rpn/
{"result":"13.0"}
eknecht@eknecht-mbp:~ $ curl -X PUT -d '{"expression": "-"}' -H "X-RPN-API-KEY:f03699b9b9f979905f88396666b312ed986ab2c7" http://localhost:4567/rpn/
{"result":"7.0"}
eknecht@eknecht-mbp:~ $

```

Running tests
---------------------
`ruby test_rpn.rb`
# Production Tips

## Security tips
Based on: [Dexter Tan & Laurence Franslay: Preparing Your Node JS Application For Scale - JSConf.Asia 2014|https://www.youtube.com/watch?v=aMblC9C68sE].

1. express and nodejs has no security - put there security middlewares
- Lusca
- Helmet
3. avoid or watchout deps which use 'eval'
2. update often your dependencies
- scan for vulnerabilities (grunt-nsp-package, created by Node Security Project)
- retire.js to check for outdated deps (grunt-retie)
4. Escape everything incoming and outgoing (against XSS) like [7:14|http://youtu.be/aMblC9C68sE?t=7m14s]

## Template specialization
- localisation (not just strings, but customize whole page)
  - how to? -> Engine Munger project.
  - use cases
    - A/B testing

## Performance

- load tests
- cloadflare - provides CDN stuff for you - touches also security stuff (especially when you dont have security team)
  - how to debug issues from to backend - CDN? Paypal has such issues sometimes (12.01.2015) - purge cache "solves" issue often
- new relic -  performance tracking software - adds 10% perf decrease
- don't optimize wrong thing
- varnish - must have servers all over the world (main botttleneck isn't webserver but the network)

- CloudFare vs Akamai
- Profiling tools in PayPal - nagios

## Other points
Talk from one of guys: Dexter Tan & Laurence Franslay - how deploy everything for free



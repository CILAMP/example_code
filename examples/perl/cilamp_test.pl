#!/usr/bin/perl

use LWP::UserAgent;
 
my $agent = LWP::UserAgent->new;
 
my $system_id = "my-system-id";   # Modify for your system-id
my $color = "#DD00FF";            # Modify for color choice
my $endpoint = "https://api.cilamp.se/v1/$system_id";
 
my $request = HTTP::Request->new(POST => $endpoint);
$request->header('content-type' => 'application/x-www-form-urlencoded');
 
my $data = "color=$color";
$request->content($data);
   
my $response = $agent->request($request);
if ($response->is_success) {
  my $message = $response->decoded_content;
  print "$message\n";
  exit 0;
} else {
  print "HTTP POST error ", $response->code, ": ", $response->message, "\n";
  exit 1;
}

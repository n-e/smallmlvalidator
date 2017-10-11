var validator = require('./validator')

function runvalidator(txt)
{
  try {
    validator.parse(txt)
    return 'OK'
  }
  catch(e) {
    return 'KO, Column ' +e.location.start.column + ': ' + e.message
  }
}

process.stdin.setEncoding('utf8');

var post = "";
process.stdin.on('readable', () => {
  const chunk = process.stdin.read();
  if (chunk !== null) {
    post += chunk;
  }

  var i = post.indexOf("\n");

  if (i > 0) {
	var line = post.substr(0, i);
	process.stdout.write(runvalidator(line) + "\n");

	post = post.substr(i + 1);
  }
});

process.stdin.on('end', () => {
  if (post != '')
    process.stdout.write(runvalidator(post)+ '\n');
});

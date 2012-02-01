## Playing with Milbot 

All the .coffee scripts are what are used to respond to requests.
If you are creating adding or editing scripts go there.

    % scripts/jenkins.coffee

It is easy to edit the scripts robot.respond or robot.hear methods
to change or add new abilities to Milbot.

### Testing Milbot Locally

You can test your bot by running the following.

    % bin/hubot

You'll see some start up output about where your scripts come from and a
prompt.

    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/scripts
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/src/scripts
    Hubot>

Then you can interact with hubot by typing `hubot help`.

    Hubot> hubot help

    Hubot> animate me <query> - The same thing as `image me`, except adds a few
    convert me <expression> to <units> - Convert expression to given units.
    help - Displays all of the help commands that Hubot knows about.
    ...

Take a look at the scripts in the `./scripts` folder for examples.
Delete any scripts you think are silly.  Add whatever functionality you
want hubot to have.

### Deploying
## Heroku

# Updating and deploying to heroku
After commiting changes to the git repository you can then push to heroku master and this will reload
milbot with your new changes/scripts etc.
    
    % git push heroku master

# Heroku environment setup
You need to add the environment variables so the hubot can connect to campfire.

    % heroku config:add HUBOT_CAMPFIRE_TOKEN="8fd92b3435cb9623e36c355935ae59667c5228a9"
    % heroku config:add HUBOT_CAMPFIRE_ROOMS="399260,470072"
    % heroku config:add HUBOT_CAMPFIRE_ACCOUNT="mil1"
    % heroku config:add HUBOT_MEMEGEN_USERNAME='milbot'
    % heroku config:add HUBOT_MEMEGEN_PASSWORD='4$friday$'
    % heroku config:add HUBOT_JENKINS_URL='http://git.middil.com:8080/'
    % heroku config:add HUBOT_JENKINS_AUTH='middilman:0107602e6f89d2d853eae675effb935f'
    % heroku config:add HUBOT_JENKINS_TOKEN='aechou2IEt5uu4ohdaeNee4x'
    % heroku config:add HUBOT_JENKINS_JOB='QAspeakez1'
    % heroku addons:add redistogo:nano

Deploying is currently manual until we get a permanant server, please let @geothird know when you 
have an update and to restart milbot.


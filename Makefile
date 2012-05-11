install:
	bundle check >/dev/null || bundle install

server:
	python -m SimpleHTTPServer

assets: install
	bundle exec sass --trace --scss --update static/scss:static/stylesheets

deploy:
	rsync -avz --delete --exclude-from=.deployignore --exclude-from=.gitignore ./ kaemming.com:webapps/new

.PHONY: install assets server deploy

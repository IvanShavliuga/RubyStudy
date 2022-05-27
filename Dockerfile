FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /rubystudy

COPY . /rubystudy/
# RUN bundle install

#COPY . .

CMD ["ruby", "main.rb"]
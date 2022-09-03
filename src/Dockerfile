FROM node:16 as febuilder
RUN mkdir /app
WORKDIR /app
COPY frontend .
RUN npm install
RUN npm run build


FROM flinkwise/ruby3-alpine14 as backend
EXPOSE 3000
EXPOSE 80

RUN mkdir /app
WORKDIR /app

ADD backend/Gemfile* ./
RUN bundle install --jobs=8

COPY backend .
COPY --from=febuilder /app/dist /app/public

# run the server
CMD bundle exec rake db:setup \
    && rails s -b 0.0.0.0 -p 80
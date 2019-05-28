# README

## About

This is a training application for the [Rails Architect MasterClass](https://arkency.com/masterclass/).

It is an extremely limited tool for personal quarterly OKR (objectives and key results) management.

Demo at: https://agnieszka-okr-tracker.herokuapp.com/

Requirements:
- ruby 2.6.3
- PostgreSQL 11

Set up:
`rake db:create db:migrate`

Run application:
`rails s`

Run tests:
`rspec spec`

## CHANGELOG

Week 3:

- Bounded context: [setting objectives](setting_objectives)
  
  Adding quarterly objectives and key results. Updating and deleting might come later :)
- Aggregate: [Objective](setting_objectives/lib/setting_objectives/objective.rb) (objective + key results)
- Value object: [Quarter](setting_objectives/lib/setting_objectives/quarter.rb)

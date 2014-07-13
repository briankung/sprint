event = Event.create!({name: "Chicago Event"})

team = Team.create!({name: "Coder By The Lake", event_id: event.id})
Submission.create!({team: team, problem: 10})
Submission.create!({team: team, problem: 82})

team = Team.create!({name: "I Was Only", event_id: event.id})
Submission.create!({team: team, problem: 19})

team = Team.create!({name: "Kernel Sanders", event_id: event.id})
Submission.create!({team: team, problem: 48})
Submission.create!({team: team, problem: 67})

team = Team.create!({name: "Nobel Laure8s", event_id: event.id})
Submission.create!({team: team, problem: 1})
Submission.create!({team: team, problem: 11})
Submission.create!({team: team, problem: 2})

team = Team.create!({name: "The Fighting Galois", event_id: event.id})
Submission.create!({team: team, problem: 144})
Submission.create!({team: team, problem: 87})

team = Team.create!({name: "The Mighty Quux", event_id: event.id})
Submission.create!({team: team, problem: 1})
Submission.create!({team: team, problem: 10})
Submission.create!({team: team, problem: 100})

team = Team.create!({name: "The Old College Trie", event_id: event.id})
Submission.create!({team: team, problem: 101})
Submission.create!({team: team, problem: 202})

team = Team.create!({name: "The Plumbers", event_id: event.id})
Submission.create!({team: team, problem: 13})
Submission.create!({team: team, problem: 5})

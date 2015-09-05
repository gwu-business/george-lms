# George LMS

A Learning Management System
 for assisting instructional operations
 of classes taught at the George Washington University.

## Prerequisites

Requires faculty access to the [GWeb Info System](https://banweb.gwu.edu).

## Usage

### Create Roster

Download Detailed Class List

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 * Choose *Detail Class List*.
 * Select a *Term*. Submit selection.
 * Select a *Course*. Submit selection.
 * View *Detail Faculty Class List*, and download source (html-only).

> This should produce a file in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/lists/class_details.html

Download Summary Class List

 1. Log in to GWeb.
 * Navigate to the *Faculty Menu*.
 + Choose *Summary Class List*.
 + Select a *Term*. Submit selection.
 + Select a *Course*. Submit selection.
 + View *Summary Faculty Class List*, and download source (html-only).

> This should produce a file in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/lists/class_summary.html

Run the Roster Creation Script

```` sh
ruby roster_creator.rb
````

> This should produce a file in the corresponding course directory: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/roster.csv and should also store a version of the roster for archival: terms/`:term_id`/courses/`:course_id`/sections/`:section_id`/rosters/roster_`YYYY-MM-DD`.csv

## Contributing

todo

## License

MIT

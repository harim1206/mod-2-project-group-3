# README
...family -< person -< tag >- memories >- family...


# rails g model Author name:string genre:string bio:text --no-test-framework

rails g model Person first_name last_name bio dob:date dod:date image_url is_account:boolean username password family_id:integer --no-test-framework
<!-- Table Person -->
Belongs to Family
Has many Tags
Has many Memories through Tags

Integer ID
String First Name
String Last Name
String Bio
Date DOB
Date DOD

String Image URL
Boolean Is Account?
String Username
String Password

(Foreign Key)
Family ID


rails g model Tag person_id:integer memory_id:integer --no-test-framework
<!-- Table Tag -->
Belongs to Person
Belongs to Memory

Integer ID

(Foreign Keys)
Integer Person ID
Integer Memory ID


rails g model Memory image_url description date:date family_id:integer --no-test-framework
<!-- Table Memory -->
Belongs to Family
Has many Tags
Has many People through Tags

Integer ID
String Image URL
String Description
Date Date

(Foreign Key)
Integer Family_ID


rails g model Family family_name image_url family_info --no-test-framework
<!-- Table Family -->
Has many People
Has many Memories

Integer ID
String Family Name
String Image URL
String Family Info







# rails g model Author name:string genre:string bio:text --no-test-framework

rails g model
























This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

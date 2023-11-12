# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int NOT NULL,
    skills_name varchar(255) NOT NULL,
    skills_description varchar(255) NOT NULL,
    skills_tag varchar(255) NOT NULL,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( skills_id, skills_name, skills_description, skills_tag ) VALUES 
 ( 1, '20 yard flop shot', 'golf ball goes higher than it does far', 'Skill 1' ),
 ( 2, '300 yard drive', 'driver drops bombs', 'Skill 2' ),
 ( 3, 'short game wizard', 'anything within 100 yds is automatic', 'Skill 3' ),
 ( 4, 'shot shaper', 'has never hit a straight shot in their life', 'Skill 4' ),
 ( 5, 'hellacious slice player', 'aims at a different hole on the tee box', 'Skill 5' ),
 ( 6, 'caddie', 'knows the best line and approach for every shot', 'Skill 6' ),
 ( 7, 'club thrower', 'sometimes the club gets thrown further than the ball', 'Skill 7' ),
 ( 8, 'fore caller', 'seems like their golf ball is a person-seeking missile', 'Skill 8' );

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(255),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people ( people_id, people_first_name, people_last_name, people_email, people_linkedin_url,
    people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined ) VALUES 
 ( 1, 'Zac', 'Person 1', 'zching9@gmail.com', 'linkedin.com/in/zacharyching', 'headshoturls.com/zching13',
    'zching13', '26 year old retired baseball player who got into golf', '2019-06-04' ),
 ( 2, 'Jack', 'Person 2', 'jalkire@hotmail.com', 'linkedin.com/in/jackalkire', 'headshoturls.com/jalkire40',
    'jamjam40', 'vcu baseball alumni and health fanatic', '2020-01-01' ),
 ( 3, 'Becky', 'Person 3', 'beckbrittford@gmail.com', 'linkedin.com/in/beckybrittford', 'headshoturls.com/beckbrittford',
    'smalltowngirl15', 'midwest girl that moved to the east coast on a whim', '2022-09-15' ),
 ( 4, 'Theresa', 'Person 4', 'tpatterson19@gmail.com', 'linkedin.com/in/theresapatterson', 'headshoturls.com/tpatterson19',
    'terryisaballer19', 'ex-softball player from a small town', '2023-02-19' ),
 ( 5, 'Andrew', 'Person 5', 'aschatz39@gmail.com', 'linkedin.com/in/andrewschatz', 'headshoturls.com/aschatz39',
    'aschatz39', 'lived in 15 states and enjoys the small things', '2021-04-19' ),
 ( 6, 'Elizabeth', 'Person 6', 'elizaswan99@gmail.com', 'linkedin.com/in/elizabethswan', 'headshoturls.com/eswanny99',
    'eswanny99', 'trilingual and always up for a challenge', '2019-05-29' ),
 ( 7, 'Tyler', 'Person 7', 'tmills29@gmail.com', 'linkedin.com/in/tylermillent', 'headshoturls.com/tmills29',
    'tmills29', 'skateboarder who enjoys being outside', '2015-06-06' ),
 ( 8, 'Lindsay', 'Person 8', 'lindsmarisanda@hotmail.com', 'linkedin.com/in/lindsaymarisanda', 'headshoturls.com/lmarisanda12',
    'lmarisanda12', 'passionate for cooking and working out', '2009-11-18' ),
 ( 9, 'Dexter', 'Person 9', 'dextermorgan@gmail.com', 'linkedin.com/in/dextermorgan', 'headshoturls.com/dmorgan55',
    'dmorgan55', 'great forensic scientist as a hobby', '2010-03-14' ),
 ( 10, 'Stacey', 'Person 10', 'staceyfalmouth@gmail.com', 'linkedin.com/in/staceyfalmouth', 'headshoturls.com/stacefal',
    'notstaceysmom23', 'jr olympics silver medalist now doing new things', '2014-09-28' );

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int NOT NULL AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    peopleskills_date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills (skills_id),
    FOREIGN KEY (people_id) REFERENCES people (people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 1, 1, '2023-11-10' ),
 ( 3, 1, '2022-05-29' ),
 ( 6, 1, '2019-08-29' );

# Person 2 has skills 3,4,5;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 3, 2, '2019-04-01' ),
 ( 4, 2, '2020-03-18' ),
 ( 5, 2, '2010-01-02' );

# Person 3 has skills 1,5;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 1, 3, '2009-10-12' ),
 ( 5, 3, '2010-07-17' );

# Person 4 has no skills;

# Person 5 has skills 3,6;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 3, 5, '2014-06-29' ),
 ( 6, 5, '2019-12-10' );

# Person 6 has skills 2,3,4;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 2, 6, '2022-01-20' ),
 ( 3, 6, '2022-11-19' ),
 ( 4, 6, '2022-12-31' );

# Person 7 has skills 3,5,6;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 3, 7, '2019-02-20' ),
 ( 5, 7, '2020-03-21' ),
 ( 6, 7, '2021-04-22' );

# Person 8 has skills 1,3,5,6;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 1, 8, '2010-11-29' ),
 ( 3, 8, '2012-12-21' ),
 ( 5, 8, '2013-06-01' ),
 ( 6, 8, '2018-03-02' );

# Person 9 has skills 2,5,6;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 2, 9, '2012-05-17' ),
 ( 5, 9, '2014-05-14' ),
 ( 6, 9, '2015-11-24' );

# Person 10 has skills 1,4,5;

INSERT INTO peopleskills ( skills_id, people_id, peopleskills_date_acquired ) VALUES 
 ( 1, 10, '2016-07-08' ),
 ( 4, 10, '2016-08-07' ),
 ( 5, 10, '2018-10-31' );

# Note that no one has yet acquired skills 7 and 8.

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int,
    roles_name varchar(255),
    roles_sort_priority int,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles VALUES
 ( 1, 'Designer', 10 ),
 ( 2, 'Developer', 20 ),
 ( 3, 'Recruit', 30 ),
 ( 4, 'Team Lead', 40 ),
 ( 5, 'Boss', 50 ),
 ( 6, 'Mentor', 60 );

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int NOT NULL AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    peopleroles_date_assigned date NOT NULL,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) references people (people_id),
    FOREIGN KEY (role_id) references roles (roles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES ( 1, 2, '2019-06-04' );

# Person 2 is Boss, Mentor

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES
 ( 2, 5, '2020-01-01' ),
 ( 2, 6, '2021-02-01' );

# Person 3 is Developer and Team Lead

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES
 ( 3, 2, '2022-09-15' ),
 ( 3, 4, '2023-07-14' );

# Person 4 is Recruit

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES ( 4, 3, '2023-02-19' );

# person 5 is Recruit

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES ( 5, 3, '2022-10-27' );

# Person 6 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES
 ( 6, 2, '2019-05-29' ),
 ( 6, 1, '2023-11-11' );

# Person 7 is Designer

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES ( 7, 1, '2016-04-22' );

# Person 8 is Designer and Team Lead

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES
 ( 8, 1, '2010-08-14' ),
 ( 8, 4, '2016-12-01' );

# Person 9 is Developer

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES ( 9, 1, '2010-03-14' );

# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, peopleroles_date_assigned) VALUES
 ( 10, 2, '2014-09-28' ),
 ( 10, 1, '2015-07-26' );
-- Insert value(s) into a user-defined postgres EMUM type
INSERT INTO gender
VALUES ('Male', 'Female', 'Unknown');
-- Select everything stored in a user-defined postgres ENUM type
select * from gender;
-- Viewing/Modifying enum values
-- You can view the list of values in an enum:
select t.typname, e.enumlabel
from pg_type t, pg_enum e
where t.oid = e.enumtypid;
-- You can append values to existing enums:
ALTER TYPE gender
ADD VALUE 'Neutered' AFTER 'Female';
-- You can select everything for your specified user-defined ENUM type:
select * from pg_type where typname = 'gender';
-- You can delete stuff too:
DELETE FROM pg_enum;  -- A little dangerous as this will delete everything!
DELETE FROM pg_type WHERE typname = 'gender';

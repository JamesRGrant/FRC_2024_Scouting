-- Create the schema from scratch (does not preserve data)
CREATE TABLE IF NOT EXISTS public.match_team_action (
    match_team_action_id SERIAL PRIMARY KEY,
    event_code VARCHAR NOT NULL,
    match_code VARCHAR NOT NULL,
    team_number INTEGER NOT NULL,
    -- Autonomous
    auto_leave SMALLINT NOT NULL,
    auto_amp SMALLINT NOT NULL,
    auto_speaker SMALLINT NOT NULL,
    
    auto_amp_fail SMALLINT NOT NULL,
    auto_speaker_fail SMALLINT NOT NULL,

    -- Teleoperated
    tele_amp SMALLINT NOT NULL,
    tele_speaker SMALLINT NOT NULL,
    tele_speaker_amped SMALLINT NOT NULL,

    tele_amp_fail SMALLINT NOT NULL,
    tele_speaker_fail SMALLINT NOT NULL,
    tele_speaker_amped_fail SMALLINT NOT NULL,

    -- End game
    end_park SMALLINT NOT NULL,
    end_hang SMALLINT NOT NULL,
    end_hang_onstage SMALLINT NOT NULL,
    end_harmony SMALLINT NOT NULL,
    end_trap SMALLINT NOT NULL,

    end_hang_fail SMALLINT NOT NULL,
    end_trap_fail SMALLINT NOT NULL,

    -- Match
    robot_disabled SMALLINT NOT NULL,

    CONSTRAINT match_team_action_id UNIQUE (match_team_action_id)
);
COMMENT ON TABLE public.match_team_action IS 'Successful or unsuccessful actions taken by a team in a match';
COMMENT ON COLUMN public.match_team_action.match_team_action_id IS 'Unique identifier';
COMMENT ON COLUMN public.match_team_action.event_code IS 'The event code for the event the match took place at, e.g. 2024mke';
COMMENT ON COLUMN public.match_team_action.match_code IS 'The match code for the match, e.g. q1';
COMMENT ON COLUMN public.match_team_action.team_number IS 'The team number for the team, e.g. 6223';

COMMENT ON COLUMN public.match_team_action.auto_leave IS 'Whether the team left the initiation line during autonomous (0=no, 1=yes)';
COMMENT ON COLUMN public.match_team_action.auto_amp IS 'Number of NOTES in AMP during auto';
COMMENT ON COLUMN public.match_team_action.auto_speaker IS 'Number of NOTES in SPEAKER during auto';

COMMENT ON COLUMN public.match_team_action.auto_amp_fail IS 'Failed attempts to AMP during auto';
COMMENT ON COLUMN public.match_team_action.auto_speaker_fail IS 'Failed attempts to SPEAKER during auto';

COMMENT ON COLUMN public.match_team_action.tele_amp IS 'Number of NOTES in AMP during teleoperated';
COMMENT ON COLUMN public.match_team_action.tele_speaker IS 'Number of NOTES in SPEAKER during teleoperated';
COMMENT ON COLUMN public.match_team_action.tele_speaker_amped IS 'Number of NOTES in SPEAKER while amplified during teleoperated';

COMMENT ON COLUMN public.match_team_action.tele_amp_fail IS 'Failed attempts to AMP during teleoperated';
COMMENT ON COLUMN public.match_team_action.tele_speaker_fail IS 'Failed attempts to SPEAKER during teleoperated';
COMMENT ON COLUMN public.match_team_action.tele_speaker_amped_fail IS 'Failed attempts to SPEAKER while amplified during teleoperated';

COMMENT ON COLUMN public.match_team_action.end_park IS 'In the park zone (not hanging)';
COMMENT ON COLUMN public.match_team_action.end_hang IS 'Successfully hanging';
COMMENT ON COLUMN public.match_team_action.end_hang_onstage IS 'Successfully hanging while ONSTAGE (human through note on pole)';
COMMENT ON COLUMN public.match_team_action.end_harmony IS 'More than one robot on a chain';
COMMENT ON COLUMN public.match_team_action.end_trap IS 'Put a NOTE in the TRAP';

COMMENT ON COLUMN public.match_team_action.end_hang_fail IS 'Failed attempt to climb (still on ground, likely "parked")';
COMMENT ON COLUMN public.match_team_action.end_trap_fail IS 'Failed attempt to put NOTE in TRAP';

COMMENT ON COLUMN public.match_team_action.robot_disabled IS 'Amount of times the robot was disabled';
GRANT ALL PRIVILEGES ON TABLE public.match_team_action TO scout;
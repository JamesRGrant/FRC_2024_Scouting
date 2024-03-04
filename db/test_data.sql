-- Insert some sample records (actual scouting data)
INSERT INTO public.match_team_action (event_code, match_code, team_number, 
    auto_leave, auto_amp, auto_speaker, auto_amp_fail, auto_speaker_fail, 
    tele_amp, tele_speaker, tele_speaker_amped, tele_amp_fail, tele_speaker_fail, tele_speaker_amped_fail, 
    end_park, end_hang, end_hang_onstage, end_harmony, end_trap, end_hang_fail, end_trap_fail, 
    robot_disabled) VALUES
('2024mndu', 'qm61', 2861, 1, 0, 2, 0, 0,   0, 6, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0,    0),
('2024mndu', 'qm62', 6381, 1, 0, 1, 0, 0,   0, 4, 0, 0, 1, 0,   0, 0, 0, 0, 0, 0, 0,    0),
('2024mndu', 'qm63', 6217, 1, 0, 2, 0, 0,   0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0,    1),
('2024mndu', 'qm65', 5653, 1, 0, 0, 0, 0,   0, 5, 0, 0, 0, 0,   1, 0, 0, 0, 0, 0, 0,    0),
('2024mndu', 'qm67', 9323, 1, 0, 1, 0, 0,   0, 6, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0,    0),
('2024mndu', 'qm71', 6421, 1, 0, 1, 0, 0,   0, 7, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0,    0)
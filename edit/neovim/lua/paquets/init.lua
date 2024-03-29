-- vim: set filetype=lua:

-- nvim-lilypond-suite {{{1

-- require('nvls').setup({
-- 	lilypond = {
-- 		mappings = {
-- 			player = "<F9>µ",
-- 			compile = "<F9>m",
-- 			open_pdf = "<F9>p",
-- 			switch_buffers = "<A-Space>",
-- 			insert_version = "<F9>v",
-- 			hyphenation = "<F9>-",
-- 			hyphenation_change_lang = "<F9>=",
-- 			insert_hyphen = "<leader>ih",
-- 			add_hyphen = "<leader>ah",
-- 			del_next_hyphen = "<leader>dh",
-- 			del_prev_hyphen = "<leader>dH",
-- 		},
-- 		options = {
-- 			pitches_language = "default",
-- 			hyphenation_language = "en_DEFAULT",
-- 			output = "pdf",
-- 			backend = nil,
-- 			main_file = "main.ly",
-- 			main_folder = "%:p:h",
-- 			include_dir = nil,
-- 			diagnostics = false,
-- 			pdf_viewer = nil,
-- 		},
-- 	},
-- 	latex = {
-- 		mappings = {
-- 			compile = "<F9>m",
-- 			open_pdf = "<F9>p",
-- 			lilypond_syntax = "<F9>s"
-- 		},
-- 		options = {
-- 			lilypond_book_flags = nil,
-- 			clean_logs = false,
-- 			main_file = "main.tex",
-- 			main_folder = "%:p:h",
-- 			include_dir = nil,
-- 			lilypond_syntax_au = "BufEnter",
-- 			pdf_viewer = nil,
-- 		},
-- 	},
-- 	texinfo = {
-- 		mappings = {
-- 			compile = "<F9>m",
-- 			open_pdf = "<F9>p",
-- 			lilypond_syntax = "<F9>s"
-- 		},
-- 		options = {
-- 			lilypond_book_flags = "--pdf",
-- 			clean_logs = false,
-- 			main_file = "main.texi",
-- 			main_folder = "%:p:h",
-- 			lilypond_syntax_au = "BufEnter",
-- 			pdf_viewer = nil,
-- 		},
-- 	},
-- 	player = {
-- 		mappings = {
-- 			quit = "q",
-- 			play_pause = "<space>",
-- 			loop = "<A-l>",
-- 			backward = "h",
-- 			small_backward = "<S-h>",
-- 			forward = "l",
-- 			small_forward = "<S-l>",
-- 			decrease_speed = "(",
-- 			increase_speed = ")",
-- 			halve_speed = "[",
-- 			double_speed = "]"
-- 		},
-- 		options = {
-- 			row = 1,
-- 			col = "99%",
-- 			width = "37",
-- 			height = "1",
-- 			border_style = "single",
-- 			winhighlight = "Normal:Normal,FloatBorder:Normal",
-- 			midi_synth = "fluidsynth",
-- 			fluidsynth_flags = {
-- 				"/usr/share/soundfonts/FluidR3_GM.sf2"
-- 			},
-- 			timidity_flags = nil,
-- 			soundfont_path = "/usr/share/soundfonts/FluidR3_GM.sf2",
-- 			audio_format = "mp3",
-- 			mpv_flags = {
-- 				--"--msg-level=cplayer=no,ffmpeg=no,alsa=no",
-- 				--"--loop",
-- 				--"--config-dir=/dev/null"
-- 				"--msg-level=cplayer=no",
-- 			}
-- 		},
-- 	},
-- })

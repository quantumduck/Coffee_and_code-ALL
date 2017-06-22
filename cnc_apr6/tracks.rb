class LyricTrack




end

class AudioMeta

  attr_accessor
    :artist
    :title
    :album
    :year
    :genere
    :track_num
    :file_name
    :file_num
    :comment
    :bitrate
    :play_time
    :bpm
    :dic_num
    :album_artist
    :conductor


end

class SongVerse


end

class SongChorus < SongVerse

end

class SongLine < String

  @@breaks_invisible = ['\u00b7', '*']
  @@breaks_visible = ['-', '\'']
  @@exceptions = ['--', '\'s']

  def words
    ignore = ['\u00b7', '*']
    split

  end

  def syllables(word)
    # print out array of syllables, assuming word had already
    # been stripped of whitespace
    sybs = [word[0]] # Ensure first character goes in.
    chars = word[1, word.length - 1].split("")
    syb_break = false
    chars.each do |char| # Iterate through characters
      if syb_break
        sybs << char
        syb_break = false
      else
        case char
        when '\u00b7'
          syb_break = true  # Set syllable break and skip
        when '*'
          syb_break = true # Set syllable break and skip
        when '\''
          sybs[-1] += char
          if 
        end
      end

    end


    breaks = ['\u00b7', '*', '-']
    sybs = []
  end

  end

end

class LineTiming

  def initialize(song_line)

  end

end

class Video < ActiveRecord::Base
	has_attached_file :video, :styles => {
    :mp4 => {
      :format => 'mp4',
      :geometry => "1200x678#",
      :convert_options => {
        :input => {},
        :output => {
          :vcodec => 'libx264',
          :movflags => '+faststart',
          :strict => :experimental
        }
      }
    },
    :webm => {
      :format => 'webm',
      :geometry => "1200x678#",
      :convert_options => {
        :input => {},
        :output => {
          :vcodec => 'libvpx',
          :acodec => 'libvorbis',
          'cpu-used' => -10,
          :deadline => :realtime,
          :strict => :experimental
        }
      }
    },

    # I couldn't get the preview to work with
    # the method outlined in the docs,
    # so I just passed the options
    # to avconv specifically.

    :preview => {
      :format => :jpg,
      :geometry => "1200x678#",
      :convert_options => {
        :output => {
          :vframes => 1,
          :s => "1200x678",
          :ss => '00:00:02'
        }
      }
    },
    :thumb => {
      :format => :jpg,
      :geometry => "300x169#",
      :convert_options => {
        :output => {
          :vframes => 1,
          :s => '300x169',
          :ss => '00:00:02'
        }
      }
    },
  },
  :processors => [:transcoder]
    do_not_validate_attachment_file_type(:video)
end

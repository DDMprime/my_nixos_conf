{ pkgs, ... }:

{

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Текстовые файлы
      "text/plain" = "kate.desktop";
      "text/x-python" = "kate.desktop";
      "text/css" = "kate.desktop";

      # Аудио
      "audio/mpeg" = "elisa.desktop";   # mp3
      "audio/flac" = "elisa.desktop";

      # Видео
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
    };
  };
}

import 'Cast.dart';
import 'Torrents.dart';

/// id : 15
/// url : "https://yts.lt/movies/16-blocks-2006?idruczs04SYr6Pgn4bvFHN_l-D4"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 54
/// description_intro : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// description_full : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"},{"name":"David Zayas","character_name":"Det. Robert Torres","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0953882.jpg","imdb_code":"0953882"}]
/// torrents : [{"url":"https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2?idruczs04SYr6Pgn4bvFHN_l-D4","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":2,"peers":10,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.lt/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6?idruczs04SYr6Pgn4bvFHN_l-D4","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":15,"peers":2,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855

class Movie {
  Movie({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.mediumScreenshotImage1, 
      this.mediumScreenshotImage2, 
      this.mediumScreenshotImage3, 
      this.largeScreenshotImage1, 
      this.largeScreenshotImage2, 
      this.largeScreenshotImage3, 
      this.cast, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  num? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
  List<Cast>? cast;
  List<Torrents>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['like_count'] = likeCount;
    map['description_intro'] = descriptionIntro;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['medium_screenshot_image1'] = mediumScreenshotImage1;
    map['medium_screenshot_image2'] = mediumScreenshotImage2;
    map['medium_screenshot_image3'] = mediumScreenshotImage3;
    map['large_screenshot_image1'] = largeScreenshotImage1;
    map['large_screenshot_image2'] = largeScreenshotImage2;
    map['large_screenshot_image3'] = largeScreenshotImage3;
    if (cast != null) {
      map['cast'] = cast?.map((v) => v.toJson()).toList();
    }
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}